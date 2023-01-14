// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';

class Mycon extends StatefulWidget {
  @override
  State<Mycon> createState() => _MyconState();
  final itemText;
  final img;
  Mycon({
    this.itemText,
    this.img,
  });
}

class _MyconState extends State<Mycon> {
  String get itemText => itemText;

  @override
  Widget build(BuildContext context) {
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
