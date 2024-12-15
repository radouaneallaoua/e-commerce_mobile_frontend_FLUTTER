import 'dart:convert';

import 'package:e_commerce_app/admin/mainpage.dart';
import 'package:e_commerce_app/providers/admin_drawer_index_provider.dart';
import 'package:e_commerce_app/providers/brand_provider.dart';
import 'package:e_commerce_app/providers/category_provider.dart';
import 'package:e_commerce_app/providers/color_provider.dart';
import 'package:e_commerce_app/providers/size_provider.dart';
import 'package:e_commerce_app/providers/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProvider()),
          ChangeNotifierProvider(create: (context) => BrandProvider()),
            ChangeNotifierProvider(create: (context) => ColorProvider()),
            ChangeNotifierProvider(create: (context) => SizeProvider()),
            ChangeNotifierProvider(create: (context) => CategoryProvider()),
          ChangeNotifierProvider(
              create: (context) => AdminDrawerIndexProvider()),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: AdminPage()));
  }
}

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  Future<void> _getProductList() async {
    print("===================");
    var response = await get(Uri.parse("http://10.0.2.2:8081/products"));
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      print(responseBody[0]["colors"]);
    } else {
      print("failure");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          onPressed: _getProductList,
          child: const Text("fetch product list"),
        ),
      ),
    );
  }
}
