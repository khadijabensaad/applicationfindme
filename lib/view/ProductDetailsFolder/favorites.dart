import 'package:find_me/controller/searchfakeproductscontroller.dart';
import 'package:find_me/view/ProductDetailsFolder/fakeproductdetails.dart';
import 'package:find_me/view/ProductSearchFolder/productdesign.dart';
import 'package:find_me/view/reviewfile/reviews.dart';
import 'package:find_me/view/widgets/appbarwideget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});
  SearchFakeProductsController controller = Get.find();
  String minimizeTitle(String title) {
    List<String> words = title.split(' ');

    return words.take(2).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Favorites',
      ),
      body:
          //get builder to see the changes happening and the controller start from<SFPC>
          GetBuilder<SearchFakeProductsController>(builder: (controller) {
        //if list isEmpty=True return circleProgressIndicator else(:) => return
        return controller.favoritesList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              )
            : ProductDesign();
      }),
    );
  }
}
