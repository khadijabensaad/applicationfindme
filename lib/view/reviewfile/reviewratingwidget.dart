import 'package:find_me/model/modelproducts.dart';
import 'package:find_me/view/reviewfile/ratingbarindicatorwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReviewRatingWidget extends StatelessWidget {
  const ReviewRatingWidget({
    Key? key,
    // required this.image,
    required this.date,
    required this.name,
    required this.rate_cmnt,
    required this.rating,
  }) : super(key: key);

  //final DateTime date;
  // final String image;
  final String date;
  final String name;
  final int rating;
  final String rate_cmnt;

  @override
  Widget build(BuildContext context) {
    Widget ratingWidget;

    if (rating >= 0 && rating <= 5) {
      ratingWidget = RatingBarIndicatorWidget(
        rating: rating.toDouble(),
      );
    } else {
      ratingWidget = const Text(
        'Error: Rating must be between 0 and 5',
        style: TextStyle(
          color: Colors.red,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      );
    }

    // Format the date using custom date format
    //  String formattedDate = DateFormat.yMMMMd('fr_FR').format(date);
    /*  Image.network(
                  image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),*/
    /*   Container(
                height: 40.0,
                width: 40.0,
                decoration: new BoxDecoration(
                    color: Colors.blue,
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child: CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),*/
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 5),
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF223263),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          RatingBarIndicatorWidget(
            rating: rating.toDouble(),
          ),
          const SizedBox(height: 15),
          Text(
            rate_cmnt,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            // formattedDate,
            date,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/*import 'package:find_me/model/modelproducts.dart';
import 'package:find_me/view/reviewfile/ratingbarindicatorwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReviewRatingWidget extends StatelessWidget {
  const ReviewRatingWidget({
    Key? key,
    required this.image,
    required this.date,
    required this.name,
    required this.rate_cmnt,
    required this.rating,
  }) : super(key: key);

  //final DateTime date;
  final String image;
  final String date;
  final String name;
  final int rating;
  final String rate_cmnt;

  @override
  Widget build(BuildContext context) {
    Widget ratingWidget;

    if (rating >= 0 && rating <= 5) {
      ratingWidget = RatingBarIndicatorWidget(
        rating: rating.toDouble(),
      );
    } else {
      ratingWidget = const Text(
        'Error: Rating must be between 0 and 5',
        style: TextStyle(
          color: Colors.red,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      );
    }

    // Format the date using custom date format
    //  String formattedDate = DateFormat.yMMMMd('fr_FR').format(date);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*  Image.network(
                  image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),*/
              Container(
                height: 40.0,
                width: 40.0,
                decoration: new BoxDecoration(
                    color: Colors.blue,
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child: CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF223263),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RatingBarIndicatorWidget(
                      rating: rating.toDouble(),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      rate_cmnt,
                      
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      // formattedDate,
                      date,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/