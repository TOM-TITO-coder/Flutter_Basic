// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class MyBodyApp extends StatefulWidget {
  const MyBodyApp({super.key});

  @override
  State<MyBodyApp> createState() => _MyBodyAppState();
}

class _MyBodyAppState extends State<MyBodyApp> {
  List<String> list=[];
  // String mytext = '';
  TextEditingController txtAdd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(       // make scroll or prevented when keyboard appear
      child: Column(
        children: [
          TextField(
            // onChanged: (String text){
            //   mytext = text;
            // },
            controller: txtAdd,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                
              ),
              labelText: 'Enter Programming',
              hintText: 'What is your programming?',
              // icon: Icon(Icons.people),
              icon: Image(
                width: 80,
                height: 80,
                // image: NetworkImage('https://toppng.com/uploads/preview/eagle-eagle-svg-icon-free-eagle-icon-11553443377ikzh2gjq59.png'),
                image: AssetImage('images/eagle_logo.png'),
              )
            ),

          ),
          ElevatedButton(
            child: Text("Add"),
            onPressed: () {
              setState(() {            // reload page, statefullwidget is only that can use it
                // list.add(mytext);
                list.add(txtAdd.text);
                txtAdd.text = '';
              });
            }
          ),
          Container(                   // wrap ListView because if ListView standalone without wrap it will be error
            height: 450,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index){    // create list view
                return ListTile(
                  title: Text(list[index]),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}