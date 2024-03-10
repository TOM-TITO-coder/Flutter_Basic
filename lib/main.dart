// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 86, 255, 91),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "កម្មវិធីខ្មែរ",
            style: TextStyle(
              fontFamily: 'KantumruyPro-Italic',
              color: Colors.white
            ), 
          ),
          backgroundColor: Color.fromARGB(174, 1, 160, 6),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(), 
              ),
              Text(
                "khmer", 
                style: TextStyle(
                  fontFamily: 'KantumruyPro-Italic',
                  color: Colors.green,
                  fontSize: 80,
                ),
              ),
              Image(
                image: NetworkImage("https://cambodianess.com/uploads/images/1660396534f0liw-a.jpg"),
              ),
              Expanded(
                child: Container(), 
              ),
              Container(
                height: 50,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
    
  }
}