
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'Product.dart';



class ProductManager{

  static final endpoint = "http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=4";

  static Future<Product> getProduct()async{

    try{
      var response = await http.get(endpoint);
      if(response.statusCode == 200){
        print(response.body);
        var product = json.decode(response.body) ;
        return Product.fromJson(product);
      }
    }catch(e){
      print(e);
      throw Exception(e);
    }
  }
}

