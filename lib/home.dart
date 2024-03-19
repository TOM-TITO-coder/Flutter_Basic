// ignore_for_file: prefer_const_constructors
import 'app_detail.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reorder Slidable"),
      ),
      body: SafeArea(
        child: AppDetail(),
      ),
    );
  }
}