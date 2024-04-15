import 'package:find_me/controller/searchfakeproductscontroller.dart';
import 'package:find_me/view/ProductDetailsFolder/fakeproductdetails.dart';
import 'package:find_me/view/reviewfile/reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDesign extends StatelessWidget {
  ProductDesign({super.key});

  String minimizeTitle(String title) {
    List<String> words = title.split(' ');

    return words.take(2).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    SearchFakeProductsController controller = Get.find();
    return ListView.separated(
      itemBuilder: (context, index) {
        //  final product =  controller.productsModel!.products![index];
        // final isFavorite =controller.favoritesList.contains(controller.productsModel!.products![index]);
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    "${controller.productsModel!.products![index].thumbnail}",
                    height: 100,
                    width: 110,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 20),
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            "${controller.favoritesList[index].description}",
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
                                onTap: () => Get.to(() => ReviewsPage()),
                                child: const Icon(
                                  Icons.star_rate_rounded,
                                  color: Color(0xFFFFBD59),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "${controller.favoritesList[index].rating}",
                                style:
                                    const TextStyle(color: Color(0xFFFFBD59)),
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
                              // if (controller.favoritesList.contains(  controller.productsModel!.products![index])){}
                              controller.removeFromFavorites(
                                  controller.productsModel!.products![index]);
                              // Get.to(() => FavoritesPage());
                            },
                            child: const Icon(
                              Icons.favorite_rounded,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
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
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      itemCount: controller.favoritesList.length,
    );
  }
}
