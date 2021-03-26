import 'package:flutter/material.dart';
Widget myAppBar(String barName){
  return AppBar(
    elevation: 15.0,
     backgroundColor: Colors.blue,
    title: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(barName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ],
      ),
    ),
  );
}