import 'package:chat_app/aboutme.dart';
import 'package:chat_app/addresses.dart';
import 'package:chat_app/orders.dart';
import 'package:chat_app/providers/userprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Expanded(
              child: Column(children: [
                SizedBox(
                    height: 300,
                    child: Stack(children: [
                      Column(children: [
                        Container(
                          height: 150,
                          color: Colors.white,
                        ),
                        Container(
                          height: 150,
                          color: Colors.blue[50],
                          child: const Column(
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              Center(
                                child: Text(
                                  "allaoua radouane",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text("allaoua@gmail.com"),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/intro3.png",
                            width: 130,
                            height: 130,
                          ),
                        ),
                      )
                    ])),
                Expanded(
                    child: Container(
                        color: Colors.blue[50],
                        child: ListView(
                          children: [
                            Card(
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(8),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const AboutMe()));
                                },
                                leading: const Icon(
                                  Icons.person_outline_outlined,
                                  color: Colors.orangeAccent,
                                ),
                                title: const Text("About me"),
                                trailing: const Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Icon(Icons.arrow_forward_ios_outlined),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(8),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Orders()));
                                },
                                leading: const Icon(
                                  CupertinoIcons.cube_box_fill,
                                  color: Colors.orangeAccent,
                                ),
                                title: const Text("My Orders"),
                                trailing: const Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Icon(Icons.arrow_forward_ios_outlined),
                                ),
                              ),
                            ),
                            
                            Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Addresses()));
                                },
                                contentPadding: const EdgeInsets.all(8),
                                leading: const Icon(
                                  CupertinoIcons.location_solid,
                                  color: Colors.orangeAccent,
                                ),
                                title: const Text("My address"),
                                trailing: const Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Icon(Icons.arrow_forward_ios_outlined),
                                ),
                              ),
                            ),
                            const Card(
                              child: ListTile(
                                contentPadding: EdgeInsets.all(8),
                                leading: Icon(
                                  Icons.notifications_active,
                                  color: Colors.orangeAccent,
                                ),
                                title: Text("Notifications"),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: const Icon(
                                      Icons.arrow_forward_ios_outlined),
                                ),
                              ),
                            ),
                            const Card(
                              child: ListTile(
                                contentPadding: EdgeInsets.all(8),
                                leading: Icon(
                                  Icons.logout,
                                  color: Colors.orangeAccent,
                                ),
                                title: Text("Sign out"),
                              ),
                            ),
                          ],
                        ))),
              ]),
            )));
  }
}
