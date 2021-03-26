import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taleb/screens/my_home_page.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
        (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
        }
    );
    secureScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/LinuxLogo.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
