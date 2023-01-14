// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:notes_app/services/login_page.dart';
import 'package:notes_app/ui/home_page.dart';

class LoginReal extends StatefulWidget {
  const LoginReal({Key? key}) : super(key: key);

  @override
  State<LoginReal> createState() => _LoginRealState();
}

class _LoginRealState extends State<LoginReal> {
  @override
  Widget build(BuildContext context) {
    TextEditingController loginname = TextEditingController();
    TextEditingController loginpassword = TextEditingController();
    return Scaffold(
      backgroundColor: bakc,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 240,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: !Platform.isWindows
                            ? Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Welcome Back.',
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Welcome Back.',
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  width: 440,
                  child: TextFormField(
                    controller: loginname,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 214, 214, 214),
                          fontWeight: FontWeight.bold),
                      suffixIcon: Icon(
                        Icons.account_circle,
                        size: 30,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(13),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 12, 12, 12),
                        ),
                      ),
                      labelText: 'Enter Your Name.',
                    ),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  width: 440,
                  child: TextFormField(
                    controller: loginpassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 214, 214, 214),
                          fontWeight: FontWeight.bold),
                      hoverColor: Colors.red,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(13),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 12, 12, 12),
                        ),
                      ),
                      labelText: 'Enter Your Password.',
                    ),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                        email: loginname.text,
                        password: loginpassword.text,
                      );
                      Get.off(HomePage());
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 133, 133),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Get.off(LoginPage());
                  },
                  child: Text(
                    "Register.",
                    style: TextStyle(
                      color: Color.fromARGB(255, 180, 180, 180),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
