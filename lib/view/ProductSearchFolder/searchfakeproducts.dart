import 'package:find_me/controller/searchfakeproductscontroller.dart';
import 'package:find_me/view/ProductDetailsFolder/favorites.dart';
import 'package:find_me/view/reviewfile/reviews.dart';
import 'package:find_me/view/widgets/appbarwideget.dart';
import 'package:find_me/view/ProductDetailsFolder/fakeproductdetails.dart';
import 'package:find_me/view/ProductSearchFolder/searchfieldwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFakeProducts extends StatelessWidget {
  SearchFakeProducts({super.key});
  SearchFakeProductsController controller =
      Get.put(SearchFakeProductsController());
  String minimizeTitle(String title) {
    List<String> words = title.split(' ');

    return words.take(2).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Find Me',
      ), // AppBar
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(children: [
          //card taatik chakil mostatil fih border radius sghir
          /* Card(
            child: Image.network(
              "https://www.freepik.com/free-vector/change-our-date-postponed-wedding-phone-app_8685744.htm#fromView=search&page=1&position=21&uuid=bd31e316-a489-4374-8e1b-618dc6e0222c",
              height: 50,
            ),
          ),*/
          const SearchFieldWidget(),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: const Icon(
                  CupertinoIcons.arrow_left,
                  size: 20,
                  color: Color(0xFFDF9A4F),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              /*IconButton(
                icon: const Icon(
                  CupertinoIcons.arrow_left,
                  size: 20,
                  color: Color(0xFFDF9A4F),
                ),
                splashRadius: 10,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),*/
              const SizedBox(
                height: 10,
              ),
              const Text(
                '4 RÉSULTATS TROUVÉS',
                style: TextStyle(
                  color: Color(0xFFDF9A4F),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          //if =! null product yrajaalik
          Expanded(
            child: GetBuilder<SearchFakeProductsController>(
              builder: (controller) => controller.productsModel != null
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        bool isInFavorites = controller.favoritesList.contains(
                            controller.productsModel!.products![index]);
                        // bool isFavorite = controller.favoritesList.contains(  controller.productsModel!.products![index]);
                        return InkWell(
                          onTap: () {
                            Get.to(() => ProductDetails(
                                  product: controller.productsModel!,
                                  index: index,
                                  currencySign: '',
                                  price: '.',
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(
                                    "${controller.productsModel!.products![index].thumbnail}",
                                    height: 100,
                                    width: 110,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 20),
                                    child: SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            minimizeTitle(
                                              "${controller.productsModel!.products![index].title}",
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "${controller.productsModel!.products![index].description}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () =>
                                                    Get.to(() => ReviewsPage()),
                                                child: const Icon(
                                                  Icons.star_rate_rounded,
                                                  color: Color(0xFFFFBD59),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                "${controller.productsModel!.products![index].rating}",
                                                style: const TextStyle(
                                                    color: Color(0xFFFFBD59)),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${controller.productsModel!.products![index].price}"
                                            r" DT",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // Check if the product is in the favorite list
                                              if (isInFavorites) {
                                                // If the product is already in favorites, remove it
                                                controller.removeFromFavorites(
                                                    controller.productsModel!
                                                        .products![index]);
                                              } else {
                                                // If the product is not in favorites, add it
                                                controller.addToFavorites(
                                                    controller.productsModel!
                                                        .products![index]);
                                              }
                                              //  Get.to(() => FavoritesPage());
                                            },
                                            child: Icon(
                                              Icons.favorite_rounded,
                                              color: isInFavorites
                                                  ? Colors.red
                                                  : null,
                                              size: 20,
                                            ),
                                          ),

                                          /* InkWell(
                                            onTap: () {
                                              if (isFavorite) {
                                                controller.removeFromFavorites(
                                                    controller.productsModel!
                                                        .products![index]);
                                              } else {
                                                controller.addToFavorites(
                                                    controller.productsModel!
                                                        .products![index]);
                                              }
                                              Get.to(() => FavoritesPage());
                                            },
                                            child: Icon(
                                              Icons.favorite_rounded,
                                              color: isFavorite
                                                  ? Colors.red
                                                  : null,
                                              size: 20,
                                            ),
                                          ),*/
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 37,
                                  height: 37,
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                  ),
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFFFFBD59),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 5),
                      itemCount: controller.productsModel!.products!.length,
                    )
                  /*GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1 / 1.4, //3arith 3a toul
                        crossAxisSpacing: 5, //spacing between products horiz
                        mainAxisSpacing: 5, //spacing vertical
                        crossAxisCount: 2,
                      ),
                      //divide horizontaly par 2
                      itemCount: controller.productsModel!.products!.length,
                      itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {},
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                "${controller.productsModel!.products![index].thumbnail}", //index of gridView
                                height: 100,
                                // width: double.infinity,
                                //fit: BoxFit.fill,
                              ),
                              Text(
                                "${controller.productsModel!.products![index].title}",
                                maxLines: 1, //title only 1 line
                                overflow: TextOverflow.ellipsis, //...
                              ),
                              Row(
                                mainAxisSize:
                                    MainAxisSize.min, //khouth 2a2al chi2 momken
                                children: [
                                  Text(
                                      "${controller.productsModel!.products![index].price}"
                                      r"TND"),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ), //aprés r c'est String et pas une variable($)
                            ],
                          ),
                        ),
                      ),
                    )*/
                  : const Center(
                      child: CircularProgressIndicator()), //else ydour
            ),
          ),
        ]),
      ),
    );
  }
}
