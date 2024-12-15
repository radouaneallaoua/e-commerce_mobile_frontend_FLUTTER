import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:e_commerce_app/model/brandmodel.dart';
import 'package:http/http.dart' as http;
class BrandProvider extends ChangeNotifier {
  bool reloadBrands;
  BrandProvider({
    this.reloadBrands = false,
  });

  setReloadBrands({required bool newReloadBrands}) async {
    reloadBrands = newReloadBrands;
    notifyListeners();
  }
   Future<List<BrandModel>> getBrands() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8081/brands'));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body).length);
      var responseBody = jsonDecode(response.body);
      List<BrandModel> brands = [];
      for (var brand in responseBody) {
        brands.add(BrandModel.fromJson(brand as Map<String, dynamic>));
      }
      return brands;
    } else {
      throw Exception('Failed to load brand');
    }
  }

   void addBrand(String name) async {
    final response = await http.post(Uri.parse('http://10.0.2.2:8081/brands'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
        }));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body).length);
    } else {
      throw Exception('Failed to load brand');
    }
  }

  void deleteBrand(int brandId) async {
    final response = await http
        .delete(Uri.parse('http://10.0.2.2:8081/brands/$brandId'));
    if (response.statusCode == 200) {
      print("deleted");
    } else {
      throw Exception('Failed to load album');
    }
  }

  void editBrand(int brandId,String name) async {
    final response = await http.put(
        Uri.parse('http://10.0.2.2:8081/brands/$brandId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
        }));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body).length);
    } else {
      throw Exception('Failed to load brand');
    }
  }
}
