import 'package:find_me/controller/searchfakeproductscontroller.dart';
import 'package:find_me/model/modelproducts.dart';
import 'package:find_me/view/ProductDetailsFolder/favorites.dart';
import 'package:find_me/view/reviewfile/reviews.dart';
import 'package:find_me/view/widgets/appbarwideget.dart';
import 'package:find_me/view/ProductDetailsFolder/colorchoice.dart';
import 'package:find_me/view/ProductDetailsFolder/containervariationwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  final ProductsModel product;
  final int index;
  ProductDetails({
    Key? key,
    required this.product,
    required this.index,
    this.isLarge = false,
    this.lineThrough = false,
    required this.currencySign,
    required this.price,
  }) : super(key: key);

  String minimizeTitle(String title) {
    List<String> words = title.split(' ');

    return words.take(2).join(' ');
  }

  /*final SearchFakeProductsController controller =
      Get.put(SearchFakeProductsController());*/
  final String currencySign, price;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    final SearchFakeProductsController controller = Get.find();

    // Check if the product is in the favorite list
    bool isInFavorites = controller.favoritesList
        .contains(controller.productsModel!.products![index]);
    return Scaffold(
      //backgroundColor: const Color(0xFFFDF1E1),
      appBar: const AppBarWidget(
        title: 'Find Me',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 2,
                ),

                /// 1 - Product Image Slider
                Container(
                  color: const Color(0xFFFDF1E1),
                  child: Stack(children: [
                    Center(
                      child: Container(
                        height: 260,
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 220, 198, 170)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "${product.products![index].thumbnail}",
                            fit: BoxFit.fill,
                            height: 240,
                          ),
                        ),
                      ),
                    ),
                    //image slider
                    Positioned(
                      right: 0,
                      bottom: 0,
                      left: 0,
                      child: SizedBox(
                        height: 60,
                        child: ListView.separated(
                          itemCount: product.products![index].images!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 10),
                          itemBuilder: (BuildContext context, int indeximg) {
                            return Container(
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  product.products![index].images![indeximg],
                                  width: 80,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ]),
                ),

                /// 2 - Product Details
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              minimizeTitle(
                                "${product.products![index].title}",
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.share,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: const Icon(
                                  Icons.star_rate_rounded,
                                  color: Color(0xFFFFBD59),
                                ),
                                /*  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: ((context) =>
                                            const ReviewsPage())));}*/
                                onPressed: () =>
                                    Get.to(() => const ReviewsPage())),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "${product.products![index].rating}",
                              style: const TextStyle(color: Color(0xFFFFBD59)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),

                        Row(
                          children: [
                            const Text(
                              "Status",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "in Stock",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                // Check if the product is in the favorite list
                                if (isInFavorites) {
                                  // If the product is already in favorites, remove it
                                  controller.removeFromFavorites(controller
                                      .productsModel!.products![index]);
                                } else {
                                  // If the product is not in favorites, add it
                                  controller.addToFavorites(controller
                                      .productsModel!.products![index]);
                                }
                                Get.to(() => FavoritesPage());
                              }, 
                              child: Icon(
                                Icons.favorite_rounded,
                                color: isInFavorites ? Colors.red : null,
                                size: 20,
                              ),
                            ),
                          ],
                        ),

                        /*   TextButton(
                        child: const Text(
                          "Variation",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {}),*/

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Brand',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "${product.products![index].brand}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),
                        //variationWideget
                        ProductContainerVariationWidget(
                          product: product,
                          index: index,
                          currencySign: '\TND',
                          price: '1000',
                          isLarge: true,
                          maxLines: 2,
                          lineThrough: false,
                        ),

                        const SizedBox(
                          height: 10,
                        ),
//Colors
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Colors",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Wrap(spacing: 8, children: [
                                ChoiceChipWidget(
                                  text: 'purple',
                                  selected: false,
                                  onSelected: (value) {},
                                ),
                                ChoiceChipWidget(
                                  text: 'pink',
                                  selected: false,
                                  onSelected: (value) {},
                                ),
                                ChoiceChipWidget(
                                  text: 'lightgreen',
                                  selected: true,
                                  onSelected: (value) {},
                                ),
                              ]),
                            ]),
//Size
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Size",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Wrap(spacing: 8, children: [
                                ChoiceChipWidget(
                                  text: 'S',
                                  selected: false,
                                  onSelected: (value) {},
                                ),
                                ChoiceChipWidget(
                                  text: 'M',
                                  selected: true,
                                  onSelected: (value) {},
                                ),
                                ChoiceChipWidget(
                                  text: 'L',
                                  selected: false,
                                  onSelected: (value) {},
                                ),
                              ]),
                            ]),
                        const Text(
                          "Details",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: ReadMoreText(
                            "${product.products![index].description}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                            trimCollapsedText: "Show more",
                            trimExpandedText: " less",
                            trimLines: 1,
                            trimMode: TrimMode.Line,
                            colorClickableText: Colors.black,
                            moreStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                            ),
                            lessStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 130, right: 100, bottom: 10, top: 20),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.white,
                                    ),
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFFFBD59),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Reviews (4)",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                ),
              ]),
        ),
      ),
    );
  }
}
