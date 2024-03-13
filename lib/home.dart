// ignore_for_file: prefer_const_constructors

import 'package:basic/mybodyapp.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is MyApp"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: MyBodyApp(),
        ),
      ),
    );
  }
}