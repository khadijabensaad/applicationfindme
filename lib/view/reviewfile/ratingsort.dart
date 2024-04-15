//NU
import 'package:find_me/model/modelproducts.dart';
import 'package:find_me/view/reviewfile/ratingbarindicatorwidget.dart';
import 'package:find_me/view/reviewfile/reviewratingwidget.dart';
import 'package:find_me/view/reviewfile/writereview.dart';
import 'package:find_me/view/reviewfile/writereviewscreen.dart';
import 'package:find_me/view/widgets/appbarwideget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

class RatingSortWidget extends StatefulWidget {
  const RatingSortWidget({Key? key}) : super(key: key);

  @override
  State<RatingSortWidget> createState() => _RatingSortWidgetState();
}

class _RatingSortWidgetState extends State<RatingSortWidget> {
  final List<Map<String, dynamic>> filedata = [
    {
      'name': "Muhammed Salah",
      'pic':
          'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1712094718~exp=1712098318~hmac=f58124092b4b467a71baea496189e8c1fd17534ea26e1463e7dd948124cc3c35&w=996',
      'rate_cmnt':
          "Les Air Max sont toujours très confortables, propres et tout simplement parfaites à tous points de vue.",
      'rating': 4,
      'date': '2021-01-01'
    },
    {
      'name': "Mariam",
      'pic':
          'https://img.freepik.com/free-photo/profile-shot-aristocratic-girl-blouse-with-frill-lady-with-flowers-her-hair-posing-proudly-against-blue-wall_197531-14304.jpg?t=st=1712094517~exp=1712098117~hmac=11e95167d9d6efbb7aa44c6574e1b8c8f514ccb023eb6bff98147cefa4b68541&w=360',
      'rate_cmnt':
          "C'est un produit vraiment incroyable, j'aime le  design du produit, j'espère pouvoir l'acheter à nouveau !",
      'rating': 3,
      'date': '2021-01-01'
    },
    {
      'name': 'Riadh',
      'pic':
          'https://img.freepik.com/premium-psd/man-with-white-shirt-that-says-he-s-smiling_410516-165846.jpg?w=740',
      'rate_cmnt': 'Very cool',
      'rating': 2,
      'date': '2021-01-01'
    },
    {
      'name': "Soukeina",
      'pic':
          'https://img.freepik.com/free-photo/young-beautiful-woman-looking-camera-trendy-girl-casual-summer-white-t-shirt-jeans-shorts-positive-female-shows-facial-emotions-funny-model-isolated-yellow_158538-15796.jpg?t=st=1712094670~exp=1712098270~hmac=6b0479e97ddb0d3d1e32d76096d5ef3c4c4a136394844cb76b7dbd4a9fd979e1&w=740',
      'rate_cmnt': "Produit magique!",
      'rating': 5,
      'date': '2021-01-01'
    },
  ];

  int? selectedRating;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF1E1),
      appBar: const AppBarWidget(
        title: 'Reviews',
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedRating = null;
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          color: const Color(0xFF965D1A),
                          child: const Center(
                            child: Text(
                              "Tous les avis",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 50,
                          width: 210,
                          child: ListView.separated(
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics(),
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 10),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedRating = index + 1;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFF965D1A),
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.star_rate_rounded,
                                          color: Color(0xFFFFBD59),
                                        ),
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        "${index + 1}",
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                if (selectedRating == null)
                  ...filedata.map((review) => ReviewRatingWidget(
                        name: review['name'],
                        rate_cmnt: review['rate_cmnt'],
                        rating: review['rating'],
                        date: review['date'],
                        //  image: review['pic'],
                      )),
                if (selectedRating != null)
                  ...filedata
                      .where((review) => review['rating'] == selectedRating)
                      .map((review) => ReviewRatingWidget(
                            name: review['name'],
                            rate_cmnt: review['rate_cmnt'],
                            rating: review['rating'],
                            date: review['date'],
                            //   image: review['pic'],
                          )),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 45,
                    child: CupertinoButton(
                      color: const Color(0xFF965D1A),
                      onPressed: () => Get.to(() => WriteReviewScreen()),
                      child: const Text(
                        "Write Review",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
