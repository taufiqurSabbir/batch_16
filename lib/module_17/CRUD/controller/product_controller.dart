import 'dart:convert';

import 'package:flutter_16/module_17/CRUD/model/product_model.dart';
import 'package:flutter_16/module_17/CRUD/utils/urls.dart';
import 'package:http/http.dart' as http;
class ProductController {

  List<Data>products = [];

  Future getProduct() async {
    final url = Uri.parse(Urls.readProductURL);
    final response = await http.get(url);
    
    print(response.statusCode);
    print(response.body);


    if(response.statusCode == 200){
        final jsonResponse = jsonDecode(response.body);

        ProductModel model = ProductModel.fromJson(jsonResponse);

        products = model.data ?? [];
    }
  }


  Future<bool>createProduct(Data data) async {
    final url = Uri.parse(Urls.createProductURL);
    final response = await http.post(url ,

    headers: {
      'Accept' : 'application/json',
      'Content-Type' : 'application/json',

    },


    body: jsonEncode(
        {
          "ProductName": data.productName,
          "ProductCode": DateTime.now().microsecondsSinceEpoch,
          "Img": data.img,
          "Qty": data.qty,
          "UnitPrice": data.unitPrice,
          "TotalPrice": data.totalPrice
        }
    )


    );


    print(response.statusCode);
    print(response.body);


    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }

  }



  Future<bool>deleteProduct(String productID) async {
    final url = Uri.parse(Urls.deleteProductURL(productID));
    final response =await http.get(url);


    if(response.statusCode ==200){
      getProduct();
      return true;
    }else{
      return false;
    }
  }




  Future<bool>updateProduct(String ProductID, Data data) async {

    final url = Uri.parse(Urls.updateProductURL(ProductID));
    final response = await http.post(url ,

        headers: {
          'Accept' : 'application/json',
          'Content-Type' : 'application/json',

        },


        body: jsonEncode(
            {
              "ProductName": data.productName,
              "ProductCode": DateTime.now().microsecondsSinceEpoch,
              "Img": data.img,
              "Qty": data.qty,
              "UnitPrice": data.unitPrice,
              "TotalPrice": data.totalPrice
            }
        )


    );


    print(response.statusCode);
    print(response.body);


    if(response.statusCode == 200){
      getProduct();
      return true;
    }else{
      return false;
    }

  }




}