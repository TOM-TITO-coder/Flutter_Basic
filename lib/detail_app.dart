// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailApp extends StatefulWidget {
  const DetailApp({super.key});

  @override
  State<DetailApp> createState() => _DetailAppState();
}

class _DetailAppState extends State<DetailApp> {

  var txt1 = TextEditingController();
  var txt2 = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            _MyTextField(txt1),
            _MyTextField(txt2),
            // Padding(
            //   padding: const EdgeInsets.only(top: 30),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomLeft: Radius.circular(30))
            //       ),
            //     ),
            //     controller: txt1,
            //     keyboardType: TextInputType.number,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 30),
            //   child: TextField(
            //     controller: txt2,
            //     keyboardType: TextInputType.number,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              // child: ElevatedButton(
              //   onPressed: _btnSumClick, 
              //   child: Text("Sum"),
              // ),
              child: CupertinoButton(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topRight: Radius.circular(20)),
                onPressed: _btnSumClick, 
                child: Text(
                  "Sum",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "Result: $result",
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 24,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _btnSumClick(){
    setState(() {
      var f = NumberFormat('\$#,##0.00');
      double v1 = double.parse(txt1.text);
      double v2 = double.parse(txt2.text);
      double sum = v1 + v2;
      // result = '$sum';
      result = f.format(sum);
      txt1.clear();
      txt2.clear();
    });
  }

  Padding _MyTextField(TextEditingController txt){
    return  Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomLeft: Radius.circular(30))
                  ),
                  hintText: "0"
                ),
                controller: txt,
                keyboardType: TextInputType.number,
              ),
            );
  }
}