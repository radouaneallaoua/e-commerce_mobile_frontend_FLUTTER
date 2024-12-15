import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_app/model/sizemodel.dart';

class SizeProvider extends ChangeNotifier {
  bool reloadSizes;
  SizeProvider({
    this.reloadSizes = false,
  });

  setReloadSizes(bool newReload) async {
    reloadSizes = newReload;
    notifyListeners();
  }

  void deleteSize(int sizeId) async {
    final response =
        await http.delete(Uri.parse('http://10.0.2.2:8081/sizes/$sizeId'));

    if (response.statusCode == 200) {
      print("deleted");
    } else {
      throw Exception('Failed to delete size');
    }
  }

  void editSize(int sizeId, String newLabel) async {
    final response =
        await http.put(Uri.parse('http://10.0.2.2:8081/sizes/$sizeId'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'label': newLabel,
            }));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body).length);
    } else {
      throw Exception('Failed to edit size');
    }
  }

  void addSize(String sizeName) async {
    final response = await http.post(Uri.parse('http://10.0.2.2:8081/sizes'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'label': sizeName,
        }));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body).length);
    } else {
      throw Exception('Failed to add size');
    }
  }

  Future<List<SizeModel>> getSizes() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8081/sizes'));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body).length);
      var responseBody = jsonDecode(response.body);
      List<SizeModel> sizes = [];
      for (var size in responseBody) {
        sizes.add(SizeModel.fromJson(size as Map<String, dynamic>));
      }
      return sizes;
    } else {
      throw Exception('Failed to load sizes');
    }
  }
}
