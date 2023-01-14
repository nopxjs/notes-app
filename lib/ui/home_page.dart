// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'package:notes_app/profile.dart';
import 'package:notes_app/services/login_page.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> items = [
  "Latte",
  "Coffee",
  'italy pizza',
  "Pizza",
  "Noodles",
  'anything'
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: bakc,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                // const SizedBox(
                //   height: 180,
                // ),
                // const SizedBox(
                //   width: 60,
                // ),

                Container(
                  margin: EdgeInsets.only(
                      left: !Platform.isWindows ? 40 : 60, top: 50),
                  child: Text(
                    'Welcome, $names',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: Platform.isWindows || Platform.isMacOS
                          ? MediaQuery.of(context).size.width * 0.03
                          : MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: !Platform.isWindows
                    ? MediaQuery.of(context).size.width * 0.03
                    : MediaQuery.of(context).size.width * 0.03,
                right: !Platform.isWindows
                    ? MediaQuery.of(context).size.width * 0.03
                    : MediaQuery.of(context).size.width * 0.03,
                bottom: !Platform.isWindows
                    ? MediaQuery.of(context).size.height * 0.04
                    : MediaQuery.of(context).size.width * 0.03,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 37, 37, 37),
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 37, 37, 37),
                    Color.fromARGB(255, 37, 37, 37),
                    Color.fromARGB(255, 27, 27, 27)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              height: Platform.isWindows
                  ? MediaQuery.of(context).size.height * 0.4
                  : MediaQuery.of(context).size.height * 0.25,
              // width: 1000,
              child: Text('Free Trial for 3 Days',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: Platform.isWindows ? 80 : 30,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: !Platform.isWindows
                  ? MediaQuery.of(context).size.height * 0.45
                  : 300,
              width: MediaQuery.of(context).size.width * 1,
              child: GridView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return con(
                    // button: true,
                    itemText: items[index],
                  );
                },
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: Platform.isWindows ? 400 : 200),
                // children: [
                //   con(button: true, text: 'View'),
                //   con(button: true, text: 'View'),
                //   con(button: true, text: 'View'),
                //   con(button: true, text: 'View'),
                //   con(button: true, text: 'View'),
                //   con(button: true, text: 'View'),
                //   con(button: true, text: 'View'),
                //   con(button: true, text: 'View'),
                // ],
              ),
            ),

            // child: ListView(
            //   children: [
            //     con(button: true),
            //     con(button: true),
            //     con(button: true),
            //     con(button: true),
            //     con(button: true),
            //   ],
            // ),

            // !Platform.isWindows
            //     ? Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //           // con(
            //           //   button: true,
            //           //   text: 'View',
            //           // ),
            //           // con(
            //           //   button: true,
            //           //   text: 'View',
            //           // ),
            //           // con(
            //           //   button: true,
            //           //   text: 'View',
            //           // ),
            //         ],
            //       )
            //     : Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //         ],
            //       ),
            // !Platform.isWindows
            //     ? Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //           // con(
            //           //   button: true,
            //           //   text: 'View',
            //           // ),
            //           // con(
            //           //   button: true,
            //           //   text: 'View',
            //           // ),
            //           // con(
            //           //   button: true,
            //           //   text: 'View',
            //           // ),
            //         ],
            //       )
            //     : Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //           con(
            //             button: true,
            //             text: 'View',
            //           ),
            //         ],
            //       ),
            // !Platform.isWindows
            //     ? Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           con(
            //             button: true,
            //             text: 'Buy',
            //           ),
            //           con(
            //             button: true,
            //             text: 'Buy',
            //           ),
            //           // con(
            //           //   button: true,
            //           //   text: 'Buy',
            //           // ),
            //           // con(
            //           //   button: true,
            //           //   text: 'Buy',
            //           // ),
            //           // con(
            //           //   button: true,
            //           //   text: 'Buy',
            //           // ),
            //         ],
            //       )
            //     : Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           con(
            //             button: true,
            //             text: 'Buy',
            //           ),
            //           con(
            //             button: true,
            //             text: 'Buy',
            //           ),
            //           con(
            //             button: true,
            //             text: 'Buy',
            //           ),
            //           con(
            //             button: true,
            //             text: 'Buy',
            //           ),
            //           con(
            //             button: true,
            //             text: 'Buy',
            //           ),
            //         ],
            //       ),

            // Container(
            //   margin: const EdgeInsets.only(left: 80, right: 80, bottom: 80),
            //   height: 200,
            //   width: 300,
            //   decoration: BoxDecoration(
            //     color: Color.fromARGB(255, 37, 37, 37),
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(left: 80, right: 80, bottom: 80),
            //   height: 200,
            //   width: 300,
            //   decoration: BoxDecoration(
            //     color: Color.fromARGB(255, 37, 37, 37),
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(left: 80, right: 80, bottom: 80),
            //   height: 200,
            //   width: 300,
            //   decoration: BoxDecoration(
            //     color: Color.fromARGB(255, 37, 37, 37),
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(left: 80, right: 80, bottom: 80),
            //   height: 200,
            //   width: 300,
            //   decoration: BoxDecoration(
            //     color: Color.fromARGB(255, 37, 37, 37),
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Container con({
    // bool button = false,
    var itemText = 'TEXT',
  }) {
    return Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
          bottom: Platform.isWindows
              ? MediaQuery.of(context).size.width * 0.02
              : MediaQuery.of(context).size.width * 0.06,
        ),
        height: Platform.isWindows
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.height * 0.20,
        width: Platform.isWindows
            ? MediaQuery.of(context).size.width * 0.15
            : MediaQuery.of(context).size.width * 0.40,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 37, 37, 37),
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 37, 37, 37),
              Color.fromARGB(255, 37, 37, 37),
              Color.fromARGB(255, 27, 27, 27)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    itemText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Platform.isWindows
                    ? MediaQuery.of(context).size.height * 0.05
                    : MediaQuery.of(context).size.height * 0.02,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  'View',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

_appBar() {
  return AppBar(
    title: Text(
      'Home',
      style: TextStyle(fontSize: 25),
    ),
    // backgroundColor: Color(0xFF121212),
    backgroundColor: bakc,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Get.off(Profile());
      },
      icon: Icon(
        Icons.person,
        size: 20,
      ),
    ),
    leadingWidth: 60,
    // leadingWidth: 80,
    elevation: 0,
    // leading: GestureDetector(
    //   onTap: () {
    //     ThemeServices().switchTheme();
    //   },
    //   child: Icon(
    //     Icons.nightlight_round,
    //     size: 20,
    //   ),
    // ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search,
          size: 23,
        ),
      ),
      SizedBox(
        width: 5,
      ),
    ],
  );
}
