import 'package:chat_app/addresses.dart';
import 'package:chat_app/admin/mainpage.dart';
import 'package:chat_app/createaccountpage.dart';
import 'package:chat_app/favorites.dart';
import 'package:chat_app/item.dart';
import 'package:chat_app/loginpage.dart';
import 'package:chat_app/onboarding.dart';
import 'package:chat_app/profile.dart';
import 'package:chat_app/providers/admin_drawer_index_provider.dart';
import 'package:chat_app/providers/userprovider.dart';
import 'package:chat_app/shippingaddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProvider()),
          ChangeNotifierProvider(create: (context) => AdminDrawerIndexProvider()),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  AdminPage())
    );
  }
}



