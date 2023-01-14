// ignore_for_file: dead_code, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notes_app/ChangeInfo.dart';
import 'package:notes_app/services/login_page.dart';
import 'package:notes_app/ui/home_page.dart';

String names = '';
String passwords = '';
bool anonymous = true;
String aboutMe = 'Hey, My name is $names';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 39, 39, 39),
      backgroundColor: bakc,

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color.fromARGB(0, 110, 207, 113),
            shadowColor: Color.fromARGB(0, 0, 0, 0),
            expandedHeight: 300,
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Get.off(HomePage());
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: Text(
              'P R O F I L E',
              style: TextStyle(color: Colors.white),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 186, 30, 233),
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 110,
                      ),
                      Container(
                        height: 80,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/profile-pic.jpg'),
                          radius: 45,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        !anonymous ? 'Hey, ${names}' : 'Anonymous',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        !anonymous ? aboutMe : 'Please Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color.fromARGB(255, 221, 221, 221)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          itemsS(
            Color.fromARGB(255, 54, 244, 139),
            Icons.manage_accounts,
            'Account Manager',
            'ManageAccount',
          ),
          itemsS(
            Color.fromARGB(255, 240, 74, 240),
            Icons.settings,
            'Change Password',
            'ChangePassword',
          ),
          itemsS(
            Color.fromARGB(255, 255, 60, 53),
            Icons.settings,
            'Delete Account',
            'DeleteAccount',
          ),
          itemsS(
            Color.fromARGB(255, 208, 24, 245),
            Icons.settings,
            'Log Out',
            'LogOut',
          ),
        ],
      ),
      // appBar: AppBar(
      //   leading: Container(
      //     child: Image.asset('lib/images/youtube-logo.png'),
      //   ),
      //   shadowColor: const Color.fromARGB(0, 255, 255, 255),
      //   backgroundColor: Color.fromARGB(255, 15, 15, 15),
      //   actions: [
      //     Container(
      //       color: const Color.fromARGB(0, 244, 67, 54),
      //       width: 50,
      //       child: const Icon(Icons.cast),
      //     ),
      //     Container(
      //       color: const Color.fromARGB(0, 172, 152, 151),
      //       width: 50,
      //       child: const Icon(Icons.notifications_none_rounded),
      //     ),
      //     Container(
      //       color: const Color.fromARGB(0, 244, 67, 54),
      //       width: 50,
      //       child: const Icon(Icons.search),
      //     )
      //   ],
      // )
    );
  }

  SliverToBoxAdapter itemsS(
      Color colors, IconData icons, String texts, String onclicks,
      {double sizes = 40}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () {
              if (onclicks == 'LogOut') {
                welcomeSnack('Logged Out', '');
                names = '';
                passwords = '';
                anonymous = true;
                aboutMe = 'Hey, My name is $names';
                Get.off(LoginPage());
              }
              if (onclicks == 'ChangePassword') {
                welcomeSnack('Logged Out', '');
                names = '';
                passwords = '';
                anonymous = true;
                aboutMe = 'Hey, My name is $names';
                Get.off(LoginPage());
              }
              if (onclicks == 'ManageAccount') {
                Get.off(const ChangeInfo());
              }
              if (onclicks == 'DeleteAccount') {
                names = '';
                passwords = '';
                anonymous = true;
                Get.off(LoginPage());
              }
            },
            child: Container(
              height: sizes,
              color: colors,
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Icon(
                    icons,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    texts,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
