// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:notes_app/profile.dart';
import 'package:notes_app/services/login_page.dart';
import 'package:notes_app/ui/home_page.dart';

class ChangeInfo extends StatefulWidget {
  const ChangeInfo({Key? key}) : super(key: key);

  @override
  State<ChangeInfo> createState() => _ChangeInfoState();
}

var aboutMes;

class _ChangeInfoState extends State<ChangeInfo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController guesseds = TextEditingController();
    TextEditingController gueesseds = TextEditingController();
    TextEditingController AboutMe = TextEditingController();

    final fromkeys = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: bakc,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 180,
              ),
              const Text(
                'Account',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              const Text(
                'Information',
                style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  width: 440,
                  child: TextFormField(
                    controller: guesseds,
                    key: fromkeys,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 214, 214, 214),
                          fontWeight: FontWeight.bold),
                      suffixIcon: Icon(
                        Icons.account_box,
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
                      labelText: 'Enter New Name.',
                    ),
                    onChanged: (value) {
                      name = guesseds.text;
                    },
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  width: 440,
                  child: TextFormField(
                    controller: gueesseds,
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
                      labelText: 'Enter New Password.',
                    ),
                    onChanged: (value) {
                      password = gueesseds.text;
                    },
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  width: 440,
                  child: TextFormField(
                    controller: AboutMe,
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
                      labelText: 'About Me.',
                    ),
                    onChanged: (value) {
                      aboutMes = AboutMe.text;
                    },
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  checkform();
                },
                child: const Text('Save Changes'),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  name = '';
                  aboutMes = '';
                  password = '';

                  Get.off(const Profile());
                },
                child: const Text(
                  'Discard',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void checkform() {
  if (names != null && names != '' && passwords != null && passwords != '') {
    if (aboutMes == null) {
      aboutMe = '';
    } else {
      aboutMe = aboutMes;
    }
    if (name != null &&
        password != null &&
        name.length > 4 &&
        name.length < 12 &&
        password.length > 4 &&
        password.length < 12) {
      welcomeSnack('Saved!', 'Your New Name: $name');
      anonymous = false;
      names = name.toString();
      passwords = password.toString();

      Get.off(HomePage());
    } else if (name == null ||
        password == null ||
        name == '' ||
        password == '') {
      Get.off(HomePage());
    } else if (name != null && name.length < 5) {
      welcomeSnack('Enter Valid Name', 'Name must be more then 5 characters');
    } else if (password != null && password.length < 6) {
      welcomeSnack(
          'Enter Valid Password', 'Password must be more then 5 characters');
    } else if (name.length > 12) {
      welcomeSnack('Enter Valid Name', 'Name must be lower then 12 characters');
    } else if (password.length > 12) {
      welcomeSnack('Enter Valid Name', 'Name must be lower then 12 characters');
    } else {
      welcomeSnack(
          'Creating account failed', 'Please Enter a Valid Information');
    }
  } else {
    welcomeSnack('Please Login', 'You are not logged in');
  }
}
