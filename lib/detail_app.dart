// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_is_empty, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailApp extends StatelessWidget {
  
  DetailApp(this.products, {super.key});
  var products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: products.length !=0 ? List.generate(
          products.length, 
          (index) => MyCardProducts(
            products[index]
          )
        )
        :[
          Center(
            child: Text('No Product Found!'),
          )
        ]
      ),
    );
  }
}

class MyCardProducts extends StatefulWidget {
  // MyCardProducts({this.product, super.key});

  var product = {};
  MyCardProducts(this.product, {super.key});

  @override
  State<MyCardProducts> createState() => _MyCardProductsState();
}

class _MyCardProductsState extends State<MyCardProducts> {
  @override
  Widget build(BuildContext context) {
    var product = widget.product;
    var f = NumberFormat('\$#,##0.00');
    return Card(
      elevation: 3,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Image(
              width: 130,
              image: AssetImage(product['photo']),
              repeat: ImageRepeat.noRepeat,
            ),
          ),
          Container(
            height: 2,
            color: Colors.lightBlueAccent,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: Text('Name:${product['name']}')),
                Expanded(
                  child: Text(
                    'Price:${f.format(product['price'])}',
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            
            onPressed: _onPress, 
            child: Text(
              'buy',
              style: TextStyle(
                fontSize: 13
              ),
            )
          ),
        ],
      ),
    );
  }

  void _onPress(){
    var f = NumberFormat("\$#,##0.00");
    var product = widget.product;

    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          actions: [
            IconButton(
              onPressed: () => {
                Navigator.of(context).pop()
              }, 
              icon: Text('OK')
            )
          ],
          title: Text('Product Detail'),
          content: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  'ID: ${product["id"]}\n'
                  'Name: ${product["name"]}\n'
                  'Price: ${f.format(product['price'])}\n'
                  'Category: ${product['category']}\n'
                  'Country: ${product['country']}\n'
                ),
              ),
              Expanded(
                child: Image(
                  width: 100,
                  image: AssetImage(
                    product['photo']
                  )
                ),
              )
            ],
          ),
        );
      }
    );
  }
}