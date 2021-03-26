import 'package:flutter/material.dart';
import 'package:taleb/screens/my_home_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Image.asset('images/LinuxLogo.png'),),
          DrawerBody(
            icon: Icons.home,
            text: 'Home Page',
            ontapped: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          ),
        ],
      ),
    );
  }
}

class DrawerBody extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function ontapped;
  DrawerBody({this.icon, this.text, this.ontapped});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontapped,
      child: ListTile(
        title: Text(text),
        leading: Icon(
          icon,
          color: Colors.blue,
        ),
      ),
    );
  }
}