// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text('This my School'),
            subtitle: Text('#118 Phnom Penh'),
            onTap: (){
              goToDetail(context, 'My School');
            },
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text('This my house'),
            subtitle: Text('#118 Phnom Penh'),
            onTap: (){
              goToDetail(context, 'My Home');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('This my Office'),
            subtitle: Text('#118 Phnom Penh'),
            onTap: (){
              goToDetail(context, 'My Office');
            },
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Office'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School'
          ),
        ],
        onTap: (index){
          if(index == 0){
            goToDetail(context, 'Home');
          }else if(index == 1){
            goToDetail(context, 'Office');
          }else{
            goToDetail(context, 'School');
          }
        },
      ),
    );
  }

  void goToDetail(BuildContext context, String title){
    Navigator.push(context, MaterialPageRoute(
      builder: (context){
                return Detail(title: title);
              } 
      )
    );
  }
}

class Detail extends StatelessWidget {
  final String title;

  const Detail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title', 
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the back arrow to white
        ),
      ),
    );
  }
}