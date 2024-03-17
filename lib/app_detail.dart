// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class AppDetail extends StatefulWidget {
  const AppDetail({super.key});

  @override
  State<AppDetail> createState() => _AppDetailState();
}

class _AppDetailState extends State<AppDetail> {

  var ls = ["TOM Tito", "Antonie", "Ozil", "Roberto"];

  @override
  Widget build(BuildContext context) {
    // return ReorderableListView(
    //   children: [
    //     // for(var temp in ls)
    //     //   ListTile(
    //     //     key: ValueKey(temp),               // to identify items in list in order to make orderList
    //     //     title: Text(temp),
    //     //   )
    //     for(var i=0; i<ls.length; i++)
    //       ListTile(
    //         key: ValueKey(i),
    //         title: Text(ls[i]),
    //       )
    //   ], 
    //   onReorder: (oldIndex, neIndex) {},
    // );

    return ReorderableListView.builder(
      itemBuilder: _itemBuilder, 
      itemCount: ls.length, 
      onReorder: _updateItem
    );
  }

  void _updateItem(int oldIndex, int newIndex){
    setState(() {
      var item = ls.removeAt(oldIndex);
      if(newIndex>oldIndex){
        newIndex--;
      }
      ls.insert(newIndex, item);
    });
  }

  void _deleteItem(int index){
    showDialog(
      context: context, 
      barrierDismissible: false,         // can't press other places, it focus on showDialog
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Are you sure you want to delete?"
          ),
          content: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        ls.removeAt(index);
                        Navigator.of(context).pop();
                      });
                    }, 
                    child: Text('Yes')
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    child: Text('No')
                  ),
                ),
              ),

            ],
          ),
        );
      }
    );
  }

  void _editItem(int index){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: TextFormField(
            initialValue: ls[index],
            onFieldSubmitted: (value) {
              setState(() {
                ls[index]=value;
                Navigator.of(context).pop();
              });
            },
          ),
        );
      }
    );
  }

  Widget _itemBuilder(BuildContext context, int index){
    return Card(
      key: ValueKey(index),
      color: index.isEven ? Colors.white70 : Colors.white38,
      shadowColor: Color(0x7A00FFFF),
      elevation: 10.6,
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.message),
          backgroundColor: Colors.white,
        ),
        title: Text(ls[index]),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => _editItem(index),            // cause this function return void
              icon: Icon(
                Icons.edit,
                color: Colors.greenAccent,
              ),
            ),
            IconButton(
              onPressed: () => _deleteItem(index),            // cause this function return void
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}