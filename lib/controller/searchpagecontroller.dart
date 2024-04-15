import 'dart:convert';
import 'package:find_me/model/modelproducts.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class SearchPageController extends GetxController {
  //snaana instance w  l'instance tnajim tkoun null
  ProductsModel? productsModel;
  getdata() async {
    http.Response response = await http.get(
        Uri.parse("https://dummyjson.com/products")); //get data from dummyjson
    Map<String, dynamic> data = jsonDecode(response.body);
    productsModel = ProductsModel.fromJson(data);
    //display lil list mtaa li products illi mawjoudin fil productsModel and he will print his title W Bch yakhou les produits =! de null(!)
    print(productsModel!.products![0].title);
  }
}
