import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_app/model/colormodel.dart';

class ColorProvider extends ChangeNotifier {
  bool reloadColors;
  ColorProvider({
    this.reloadColors = false,
  });

  setReloadColors(bool newReload) async {
    reloadColors = newReload;
    notifyListeners();
  }


  void deleteColor(int colorId) async {
    final response =
        await http.delete(Uri.parse('http://10.0.2.2:8081/colors/$colorId'));

    if (response.statusCode == 200) {
      print("deleted");
    } else {
      throw Exception('Failed to delete color');
    }
  }

  void editColor(int colorId, String newLabel) async {
    final response =
        await http.put(Uri.parse('http://10.0.2.2:8081/colors/$colorId'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'label': newLabel,
            }));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body).length);
    } else {
      throw Exception('Failed to edit color');
    }
  }

  void addColor(String colorName) async {
    final response = await http.post(Uri.parse('http://10.0.2.2:8081/colors'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'color': colorName,
        }));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body).length);
    } else {
      throw Exception('Failed to add color');
    }
  }

  Future<List<ColorModel>> getColors() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8081/colors'));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body).length);
      var responseBody = jsonDecode(response.body);
      List<ColorModel> colors = [];
      for (var color in responseBody) {
        colors.add(ColorModel.fromJson(color as Map<String, dynamic>));
      }
      return colors;
    } else {
      throw Exception('Failed to load colors');
    }
  }
}
