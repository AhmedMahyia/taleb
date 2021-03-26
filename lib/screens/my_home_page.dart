import 'package:flutter/material.dart';
import 'package:taleb/widgets/gridview.dart';
import 'package:taleb/widgets/my_appbar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Home'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/onlinecourse.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)
          ),
        ),
        child: GridViewItems(),
      )
    );
  }
}
