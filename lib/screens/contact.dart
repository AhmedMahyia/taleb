import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taleb/functions/custom_launcher.dart';
import 'package:taleb/widgets/contact_item.dart';
import 'package:taleb/widgets/my_appbar.dart';
import 'package:taleb/widgets/drawer.dart';

class Contacts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar('Contact US'),
        drawer: MyDrawer(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/onlinecourse.jpg"),
              fit: BoxFit.cover,
              colorFilter:
              ColorFilter.mode(Colors.black45, BlendMode.darken),
            ),
          ),
          child:Center(
            child: Column(
mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('images/LinuxLogo.png'),
                  backgroundColor: Colors.white24,
                ),
                Divider(),
                ContactItem(photo:'images/call.png' ,text:'tel:+20 100 620 6913' ,onTaped:()=>customLauncher("tel:+20 100 620 6913") ,),
                ContactItem(photo:'images/whatsapp.png' ,text:'Whats:+20 100 620 6913' ,onTaped:()=>customLauncher('whatsapp://send?phone=+20 100 620 9613') ,),
                ContactItem(photo:'images/facebook.png' ,text:'Our Facebook' ,onTaped:()=>customLauncher('https://m.facebook.com/Linux-109313914116329/?_rdr') ,),
              ],
            ),
          ) ,
        ),
    );
  }
}

