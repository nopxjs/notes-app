// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:notes_app/loginreal.dart';
import 'package:notes_app/profile.dart';
import 'package:notes_app/ui/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

var name;
var password;
var bakc = Color.fromARGB(255, 26, 26, 26);
var namel;
void welcomeSnack(String label, String massenger) {
  Get.snackbar("Welcome!", "You are in Free trial for 5 Days!",
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        label,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        massenger,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      margin: EdgeInsets.only(bottom: 20, left: 5, right: 5),
      snackStyle: SnackStyle.FLOATING);
}

class _MyWidgetState extends State<LoginPage> {
  TextEditingController guessed = TextEditingController();
  TextEditingController gueessed = TextEditingController();
  @override
  Future<void> checkform() async {
    if (name != null &&
        password != null &&
        password.length > 4 &&
        password.length < 12) {
      ////////////////////////////////firebase start
      FirebaseAuth.instance.idTokenChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: guessed.text,
          password: gueessed.text,
        );
        welcomeSnack('Account Created!', 'Creating Account Successfuly!');
        anonymous = false;
        names = name.toString();
        passwords = password.toString();
        Get.off(HomePage());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
/////////////////////////////////////firebase end

    } else if (name == null || name.length < 5) {
      welcomeSnack('Enter Valid Name', 'Name must be more then 5 characters');
    } else if (password == null || password.length < 6) {
      welcomeSnack(
          'Enter Valid Password', 'Password must be more then 5 characters');
    } else if (name.length > 12) {
      welcomeSnack('Enter Valid Name', 'Name must be lower then 8 characters');
    } else if (password.length > 12) {
      welcomeSnack('Enter Valid Name', 'Name must be lower then 8 characters');
    } else {
      welcomeSnack(
          'Creating account failed', 'Please Enter a Valid Information');
    }
  }

  Widget build(BuildContext context) {
    final fromkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: bakc,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
            child: Column(
          children: [
            const SizedBox(
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
                                'Register.',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'Register.',
                                style: Theme.of(context).textTheme.headline2,
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
                  controller: guessed,
                  key: fromkey,
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
                  onChanged: (value) {
                    name = guessed.text;
                    namel = name.length;
                  },
                  validator: (value) {
                    if (value == null || int.tryParse(value) == null) {
                      return "Must Be an integer";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                width: 440,
                child: TextFormField(
                  controller: gueessed,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 214, 214, 214),
                        fontWeight: FontWeight.bold),
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
                    labelText: 'Create a Password.',
                  ),
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  onChanged: (value) {
                    password = gueessed.text;
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                child: OutlinedButton(
                  onPressed: () {
                    checkform();
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 133, 133),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.off(LoginReal());
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Color.fromARGB(255, 180, 180, 180),
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
