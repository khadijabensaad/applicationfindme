import 'dart:convert';
import 'package:find_me/model/modelproducts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFakeProductsController extends GetxController {
  @override
  void onInit() {
    //bch data todhhir toul
    getdata();
  }

  //snaana instance w  l'instance tnajim tkoun null
  ProductsModel? productsModel;
  getdata() async {
    http.Response response = await http.get(
        Uri.parse("https://dummyjson.com/products")); //get data from dummyjson
    //khater eni ma7achtich ken b response 7achti b map avec type dynamic bch najim nit7akim feha
    Map<String, dynamic> data = jsonDecode(response.body);
    productsModel = ProductsModel.fromJson(data);
    //display list mtaa li products illi mawjoudin fil productsModel and he will print only of products =! de null(!)
    print(productsModel!.products![10].title);
    update(); //bch toul tsir maj lil products
  }

  /*void toggleFavorite(int index) {
    final product = productsModel!.products![index];
    if (favoritesList.contains(product)) {
      removeFromFavorites(product);
    } else {
      addToFavorites(product);
    }
  }*/
  List<Products> favoritesList = [];
  addToFavorites(product) {
    favoritesList.add(product);
    // print(favoritesList.length);
    update();
  }

  removeFromFavorites(product) {
    favoritesList.remove(product);
    update();
  }
}
/*import 'dart:convert';

import 'package:find_me/model/modelproducts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFakeProductsController extends GetxController {
  @override
  void onInit() {
    // Fetch data when the controller is initialized
    getData();
    super.onInit();
  }

  // Define productsModel with null safety
  ProductsModel? productsModel;

  void getData() async {
    try {
      // Make the API request
      final response =
          await http.get(Uri.parse("https://dummyjson.com/products"));

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse JSON response
        final Map<String, dynamic> data = jsonDecode(response.body);

        // Map JSON data to ProductsModel
        productsModel = ProductsModel.fromJson(data);

        // Log the product title of a specific item for debugging
        if (productsModel != null && productsModel!.products != null) {
          print(productsModel!.products![10].title);
        }

        // Notify listeners of the change
        update();
      } else {
        // If the request was not successful, print an error message
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      // Catch any exceptions and print the error message
      print("Error fetching data: $e");
    }
  }
}
*/