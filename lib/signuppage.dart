import 'package:chat_app/createaccountpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) => const CreateAccountPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.decelerate;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: ListView(
          children: [
            const SizedBox(height: 80,),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset(
                  "assets/logo.png",
                  height: 200,
                  
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Text(
                "Welcome to our store",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Text(
                "Welcome to our store the best store in the world we offer a lot of things and services with a minimal tototo titi",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ElevatedButton(
                          onPressed: () {
                            print("tap0");
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.facebook,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("continue with google")
                              ],
                            ),
                          )),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          print("tap0");
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.facebook,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("continue with facebook")
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      padding: const EdgeInsets.all(10),
                      minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.orange,
                        onPressed: () {
                          Navigator.of(context).push(_createRoute());
                        },
                        child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Create an account",
                              style: TextStyle(color: Colors.white,fontSize: 20),
                            ))),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
