import 'package:comment_box/comment/comment.dart';
import 'package:find_me/view/reviewfile/reviewratingwidget.dart';
import 'package:find_me/view/widgets/appbarwideget.dart';
import 'package:flutter/material.dart';

class WriteReviewScreen extends StatefulWidget {
  @override
  _WriteReviewScreenState createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': "Muhammed Salah",
      'pic':
          'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1712094718~exp=1712098318~hmac=f58124092b4b467a71baea496189e8c1fd17534ea26e1463e7dd948124cc3c35&w=996',
      'rate_cmnt':
          "Les Air Max sont toujours très confortables, propres et tout simplement parfaites à tous points de vue.",
      'rating': 3,
      'date': '2021-01-01 '
    },
    {
      'name': "Mariam",
      'pic':
          'https://img.freepik.com/free-photo/profile-shot-aristocratic-girl-blouse-with-frill-lady-with-flowers-her-hair-posing-proudly-against-blue-wall_197531-14304.jpg?t=st=1712094517~exp=1712098117~hmac=11e95167d9d6efbb7aa44c6574e1b8c8f514ccb023eb6bff98147cefa4b68541&w=360',
      'rate_cmnt':
          "C'est un produit vraiment incroyable, j'aime le  design du produit, j'espère pouvoir l'acheter à nouveau !",
      'rating': 4,
      'date': '2021-01-01 '
    },
    {
      'name': 'Riadh',
      'pic':
          'https://img.freepik.com/premium-psd/man-with-white-shirt-that-says-he-s-smiling_410516-165846.jpg?w=740',
      'rate_cmnt': 'Very cool',
      'rating': 2,
      'date': '2021-01-01 '
    },
    {
      'name': "Soukeina",
      'pic':
          'https://img.freepik.com/free-photo/young-beautiful-woman-looking-camera-trendy-girl-casual-summer-white-t-shirt-jeans-shorts-positive-female-shows-facial-emotions-funny-model-isolated-yellow_158538-15796.jpg?t=st=1712094670~exp=1712098270~hmac=6b0479e97ddb0d3d1e32d76096d5ef3c4c4a136394844cb76b7dbd4a9fd979e1&w=740',
      'rate_cmnt': "Produit magique!",
      'rating': 5,
      'date': '2021-01-01 '
    },
  ];

  Widget commentChild(data) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 20),
            child: ReviewRatingWidget(
              name: data[i]['name'],
              rate_cmnt: data[i]['rate_cmnt'],
              rating: data[i]['rating'],
              date: data[i]['date'],
              /* image: data[i]['pic'],*/
            ),
            /*ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),*/
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Write review"),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: CommentBox(
          userImage: CommentBox.commentImageParser(
              imageURLorPath: "assets/images/avatar.png"),
          child: commentChild(filedata),
          labelText: 'Add your review ...',
          errorText: 'Comment cannot be blank',
          withBorder: true,
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  /*   'pic':
                      'https://img.freepik.com/free-photo/cheerful-girl-cashmere-sweater-laughs-against-backdrop-blossoming-sakura-portrait-woman-yellow-hoodie-city-spring_197531-17886.jpg?t=st=1712094908~exp=1712098508~hmac=87b517de4f4ee2edb9a951f6248297821a7d741790319886dd337412a2806c58&w=360',*/
                  'rate_cmnt': commentController.text,
                  'rating': 5,
                  'date': '2024-05-15'
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: const Color(0xFFFDF1E1),
          textColor: Colors.grey,
          sendWidget:
              const Icon(Icons.send_sharp, size: 30, color: Colors.grey),
        ),
      ),
    );
  }
}
