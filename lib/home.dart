// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:basic/detail_app.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  var controller;
  var header = ['Soft Drink', 'Food', 'Beer'];
  var ls = [
    [
      // {
      //   'id': 1,
      //   'name': 'coca',
      //   'price': 1,
      //   'country': 'KH',
      //   'photo': 'images/coca.jpg'
      // }
    ],
    [
      {
        'id': 100,
        'name': 'Pizza',
        'price': 5,
        'country': 'KH',
        'category': 'Food',
        'photo': 'images/pizza.png'
      },
      {
        'id': 101,
        'name': 'Burger',
        'price': 5,
        'country': 'KH',
        'category': "Food",
        'photo': 'images/burger.png'
      },
      {
        'id': 102,
        'name': 'Burger',
        'price': 5,
        'country': 'KH',
        'category': "Food",
        'photo': 'images/burger.png'
      }
    ],
    [
      {
        'id': 200,
        'name': 'Heineken',
        'price': 1.5,
        'country': 'KH',
        'category': 'Beer',
        'photo': 'images/heineken.png'
      }
    ]
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: header.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        bottom: TabBar(
          controller: controller,
          tabs: [
            for(var head in header)
              Tab(
                child: Text(head),
              )
          ]
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          for(var products in ls) DetailApp(products)
        ],
      ),

    );
  }
}