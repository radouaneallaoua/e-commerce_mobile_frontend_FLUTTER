// ignore_for_file: void_checks

import 'dart:convert';
import 'package:e_commerce_app/admin/mainpage.dart';
import 'package:e_commerce_app/createaccountpage.dart';
import 'package:e_commerce_app/mainpage.dart';
import 'package:e_commerce_app/providers/userprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  late TextEditingController password;
  late TextEditingController email;
  late List users;

  Future _fetchUsers() async {
    final url = Uri.parse('http://192.168.161.216:8000/users');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return {};
  }

  Map _login(String email, String password) {
    for (int i = 0; i < users.length; i++) {
      if (users[i]["email"] == email && users[i]["password"] == password) {
        return users[i];
      }
    }
    return {};
  }

  @override
  void initState() {
    password = TextEditingController();
    email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset(
                  "assets/logo.png",
                  width: 200,
                  height: 200,
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Login",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Login to continue using the app",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Email",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: email,
            decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(CupertinoIcons.mail),
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Password",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              TextField(
                controller: password,
                obscureText: !showPassword,
                decoration: const InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.person),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              Align(
                heightFactor: 1.1,
                alignment: AlignmentDirectional.bottomEnd,
                child: IconButton(
                  icon: showPassword
                      ? const Icon(CupertinoIcons.eye_slash_fill)
                      : const Icon(CupertinoIcons.eye_fill),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topRight,
            child:
                TextButton(onPressed: () {}, child: const Text("Forget password ?")),
          ),
          const SizedBox(
            height: 10,
          ),
          Builder(builder: (context) {
            return MaterialButton(
              padding: const EdgeInsets.all(15),
              color: const Color.fromARGB(255, 15, 122, 210),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              minWidth: double.infinity,
              onPressed: () {
                Map user = _login(email.text, password.text);
                print(user);
                if (user != {}) {
                  context
                      .read<UserProvider>()
                      .changeAddress(newAddress: user["address"]);
                  context
                      .read<UserProvider>()
                      .changeEamil(newEmail: user["email"]);
                  context
                      .read<UserProvider>()
                      .changePhone(newPhone: user["phone"]);
                  context
                      .read<UserProvider>()
                      .changeProfileImage(newProfileImage: user["profile"]);
                  context
                      .read<UserProvider>()
                      .changeUserId(newUserId: user["id"]);
                  context
                      .read<UserProvider>()
                      .changeUserName(newUserName: user["userName"]);
                  context.read<UserProvider>().changeRole(role: user["role"]);
                  String role = user["role"];
                  if (role == "ADMIN") {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const AdminPage()),
                        (route) => false);

                
                  } else {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const MainPage()),
                        (route) => false);
                  }
                } else {
                  print("error");
                }
              },
              child: const Text(
                "Sign in",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            );
          }),
          const SizedBox(
            height: 10,
            // child: FutureBuilder(
            //     future: _fetchUsers(),
            //     builder: (context, snapshot) {
            //       return ListView.builder(
            //           itemCount: snapshot.data!.length,
            //           itemBuilder: (context, index) {
            //             users = snapshot.data;
            //             return const Visibility(
            //               visible: false,
            //               child: Text(""),
            //             );
            //           });
            //     }),
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              Expanded(
                  child: Divider(
                thickness: 1,
              )),
              Text(
                "Do not have an account ?",
                style: TextStyle(fontSize: 16),
              ),
              Expanded(
                  child: Divider(
                thickness: 1,
              )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const CreateAccountPage()));
              },
              child: const Text("Sign up"))
        ],
      ),
    ));
  }
}
