// ignore_for_file: prefer_const_constructors

import 'package:basic/detail_app.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sum Value"),
      ),
      body: DetailApp(),
    );
  }
}