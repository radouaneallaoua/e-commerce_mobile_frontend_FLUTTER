import 'package:e_commerce_app/loginpage.dart';
import 'package:e_commerce_app/providers/userprovider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/mainpage.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool showPassword = false;
  bool picked = false;
  bool accountCreated = false;
  File? file;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController address;
  late TextEditingController phone;
  late TextEditingController password;
  @override
  void initState() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    address = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    address.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> _signUp(File? file) async {
    final url = Uri.parse('http://100.77.21.54:8000/users');

    var request = http.MultipartRequest('POST', url)
      ..fields['username'] = username.text
      ..fields['email'] = email.text
      ..fields['phone'] = phone.text
      ..fields['password'] = password.text
      ..fields['address'] = address.text;

    if (file != null) {
      var stream = http.ByteStream(file.openRead());
      stream.cast();
      var length = await file.length();
      var multipartFile = http.MultipartFile(
        'file',
        stream,
        length,
        filename: basename(file.path),
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(multipartFile);
    }

    var response = await request.send();
    if (response.statusCode == 200) {
      accountCreated = true;
      print(response);
    } else {
      accountCreated = false;
    }
  }

  Future<void> _pick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      File file2 = File(result.files.single.path!);
      picked = true;
      file = file2;
    } else {
      if (file == null) {
        picked = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Positioned(
            top: 10,
            left: 10,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(CupertinoIcons.back, size: 30)),
            )),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.contain,
            width: double.infinity,
            height: 150,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create an account",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "create account quickly",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: username,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please choose an username";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Username",
                      prefixIcon: Icon(CupertinoIcons.person),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Phone number can not be empty";
                    }

                    if (value.length < 10) {
                      return "Phone number can not has length less than 10 digits";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Phone Number",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(CupertinoIcons.phone),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email can not be empty";
                    }
                    if (value.length < 10) {
                      return "Email can not has length less than 10 characters";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(CupertinoIcons.mail),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: address,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Address can not be empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Address",
                      prefixIcon: Icon(CupertinoIcons.location),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please choose a password";
                        }
                        if (value.length < 8) {
                          return "choose a password with length greater than 8 characters";
                        }
                        return null;
                      },
                      obscureText: !showPassword,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.lock),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
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
                  height: 15,
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: MaterialButton(
                        padding: const EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: const Color.fromARGB(255, 21, 26, 98),
                        onPressed: () {
                          _pick();
                        },
                        child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_upload,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Pick your profile image",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                    padding: const EdgeInsets.all(10),
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.orange,
                    onPressed: () {
                      if (_formState.currentState!.validate()) {
                        if (picked) {
                          _signUp(file);
                          if (accountCreated == true) {
                            context
                                .read<UserProvider>()
                                .changeUserName(newUserName: username.text);
                            context
                                .read<UserProvider>()
                                .changeAddress(newAddress: address.text);
                            context
                                .read<UserProvider>()
                                .changePhone(newPhone: phone.text);
                            context
                                .read<UserProvider>()
                                .changeEamil(newEmail: email.text);

                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.rightSlide,
                              title: 'Account Created successfully',
                              desc:
                                  'Yours account is created successfully.I big welcome to you',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                Future.delayed(const Duration(seconds: 2));
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const MainPage()),
                                    (route) => false);
                              },
                            ).show();
                          } else {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'An error ocured .Account Not created',
                              desc: 'Please try again',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                            accountCreated = false;
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              action: SnackBarAction(
                                  label: "Ok",
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  }),
                              backgroundColor: Colors.black,
                              content: const Text(
                                "please select a profile image",
                                style: TextStyle(color: Colors.white),
                              )));
                        }
                      } else {
                        print("not valid");
                      }

                      /*Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const MainPage()),
                        (route) => false,
                      );*/
                    },
                    child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Create an account",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))),
                const SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                      },
                      child: const Text("Login",
                          style: TextStyle(
                              color: Colors.orangeAccent, fontSize: 20)))
                ])
              ],
            ),
          ),
        )
      ],
    ));
  }
}
