import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_app/model/categorymodel.dart';

class CategoryProvider extends ChangeNotifier {
  bool reloadCategories;
  CategoryProvider({
    this.reloadCategories = false,
  });

  setReloadCategories(bool newReload) async {
    reloadCategories = newReload;
    notifyListeners();
  }

  void deleteCategory(int categoryId) async {
    final response = await http
        .delete(Uri.parse('http://10.0.2.2:8081/categories/$categoryId'));

    if (response.statusCode == 200) {
      print("deleted");
    } else {
      throw Exception('Failed to delete category');
    }
  }

  void editCategory(int categoryId, String newName, String newDescription,
      File? newImage, int? parentCategoryId) async {
    final response =
        await http.put(Uri.parse('http://10.0.2.2:8081/categories/$categoryId'),
            headers: <String, String>{
              'Content-Type': 'multipart/form-data; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'name': newName,
              'description': newDescription,
              'imageURL': newImage,
              'parentCategoryId': parentCategoryId
            }));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body).length);
    } else {
      throw Exception('Failed to edit category');
    }
  }

  Future<void> addCategory({
    required String categoryName,
    required String description,
    required File image,
    int? parentCategoryId,
  }) async {
    const String url = 'https://example.com/upload';
    final Uri uri = Uri.parse(url);

    try {
      final request = http.MultipartRequest('POST', uri);

      request.files.add(
        await http.MultipartFile.fromPath(
          'imageURL',
          image.path,
        ),
      );
      request.fields['name'] = categoryName;
      request.fields['description'] = description;
      if (parentCategoryId != null) {
        request.fields['parentCategoryId'] = parentCategoryId.toString();
      }

      final http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final String responseBody = await response.stream.bytesToString();
        print('Response Body: $responseBody');
      } else {
        print('Error: ${response.statusCode}');
        print('Response Body: ${await response.stream.bytesToString()}');
      }
    } catch (error) {
      print('Exception: $error');
    }
  }

//   void addCategory({
//     required String categoryName,
//     required String description,
//     required File image,
//     int? parentCategoryId,
//   }) async {
//     final uri = Uri.parse('http://10.0.0.2:8081/categories');

//     // Create a multipart request
//     var request = http.MultipartRequest('POST', uri)
//       ..fields['name'] = categoryName
//       ..fields['description'] = description;

//     if (parentCategoryId != null) {
//       request.fields['parentCategoryId'] = parentCategoryId.toString();
//     }

//     // Add the file to the request
//     request.files.add(await http.MultipartFile.fromPath(
//       'imageURL', // This should match the key expected by your backend
//       image.path,
//     ));

//     try {
//       // Send the request
//       var response = await request.send();

//       if (response.statusCode == 200) {
//         print('Category added successfully!');
//         var responseBody = await response.stream.bytesToString();
//         print(jsonDecode(responseBody));
//       } else {
//         throw Exception(
//             'Failed to add category. Status Code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

  Future<List<CategoryModel>> getCategories() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8081/categories'));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body).length);
      var responseBody = jsonDecode(response.body);
      List<CategoryModel> categories = [];
      for (var category in responseBody) {
        categories
            .add(CategoryModel.fromJson(category as Map<String, dynamic>));
      }
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
