// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:basic/people.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AppDetail extends StatefulWidget {
  const AppDetail({super.key});

  @override
  State<AppDetail> createState() => _AppDetailState();
}

class _AppDetailState extends State<AppDetail> {

  var ls = People.generate();

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: ls.length,
      onReorder: _onRecorder,
    );
  }

  Widget _itemBuilder(BuildContext context, int index){
    return Slidable(
      key: ValueKey(ls[index].id),    //  can't use index with Slidable
      
      // startActionPane: ActionPane(
      //   motion: DrawerMotion(),
        
      //   children: [
      //     SlidableAction(
      //       autoClose: false,
      //       onPressed: (context) => _onTabEdit(context, index),
      //       backgroundColor: Color(0xFFFE4A49),
      //       foregroundColor: Colors.white,
      //       label: 'Edit',
      //       icon: Icons.edit,
            
      //     ),
      //     SlidableAction(
      //       onPressed: (context) => _onTabEdit(context, index),
      //       backgroundColor: Color(0xFFFE4A49),
      //       foregroundColor: Colors.white,
      //       label: 'delete',
      //       icon: Icons.delete,
            
      //     )
      //   ],
      // ),
      
      endActionPane: ActionPane(
        dismissible: DismissiblePane(onDismissed: (){
          setState(() {
            ls.removeAt(index);
          });
        }),
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            autoClose: false,
            onPressed: (context) => _onTabEdit(context, index),
            backgroundColor: Colors.greenAccent,
            foregroundColor: Colors.white,
            label: 'Edit',
            icon: Icons.edit,
          ),

          SlidableAction(
            autoClose: false,
            onPressed: (context) => _onTabDelete(context, index),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            label: 'Delete',
            icon: Icons.delete,
          )
        ],
      ),
      
      child: ListTile(
        key: ValueKey(ls[index].id),
        leading: CircleAvatar(
          backgroundImage: AssetImage(ls[index].photo),
          radius: 30,
        ),
        title: Text(ls[index].name),
        subtitle: Text(ls[index].email),
      ),
    );
  }

  void _onTabEdit(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Click Edit"),
        backgroundColor: Colors.grey,
      ),
    );

    // Fluttertoast.showToast(
    //   msg: "Edit", // Use specific person name
    //   backgroundColor: Colors.blueAccent, // Updated color for clarity
    //   toastLength: Toast.LENGTH_SHORT, // Optional: Set toast duration
    // );
    
  }

  void _onTabDelete(BuildContext context, int index){
    setState(() {
      ls.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Click Delete"),
          backgroundColor: Colors.grey,
        ),
      );
    });
  }


  void _onRecorder(int oldIndex, int newIndex){
    setState(() {
      
      var item = ls.removeAt(oldIndex);
      if(newIndex>oldIndex) newIndex--;
      ls.insert(newIndex, item);

    });
  }
}