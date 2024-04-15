import 'package:find_me/model/modelproducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductContainerVariationWidget extends StatelessWidget {
   final ProductsModel product;
  final int index;
  const ProductContainerVariationWidget({
    super.key,
     required this.product,
    required this.index,
    this.currencySign = '\TND',
    required this.price,
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
  });
  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  @override
  Widget build(BuildContext context) {
    return   Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDF1E1),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 220, 198, 170)
                                    .withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text(
                                    "variation",
                                    //  maxLines: 2,
                                    //  overflow: TextOverflow.ellipsis,
                                    style: isLarge
                                        ? Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .apply(
                                                decoration: lineThrough
                                                    ? TextDecoration.lineThrough
                                                    : null)
                                        : Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .apply(
                                                decoration: lineThrough
                                                    ? TextDecoration.lineThrough
                                                    : null),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'Price: ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              '\1000 DT',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .apply(
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                            ),

                                            const SizedBox(width: 10),

                                            /// Sale Price
                                            Text(
                                              "${product.products![index].price}"
                                              r" DT",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Row(children: [
                                          Text(
                                            "Stock:",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            "In Stock",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ]),
                                      ]),
                                ]),
                              ],
                            ),
                          ),
                        );
  }
}
