import 'package:flutter/material.dart';
import 'package:taleb/widgets/contact_item.dart';
import 'package:taleb/widgets/my_appbar.dart';
import 'package:taleb/widgets/drawer.dart';
import 'package:taleb/functions/custom_launcher.dart';
class AskTeacher extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar('Ask Teacher'),
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
                   radius: 60,
                   child: Center(child: Image.asset('images/teacher.png',height: 80,width: 80,)),
                   backgroundColor: Colors.white,
                 ),
                 Divider(),
                 ContactItem(photo:'images/call.png' ,text:'tel:+20 100 620 6913' ,onTaped:()=>customLauncher("tel:+20 100 620 6913") ,),
                 ContactItem(photo:'images/whatsapp.png' ,text:'Whats:+20 100 620 6913' ,onTaped:()=>customLauncher('whatsapp://send?phone=+20 100 620 9613') ,),

               ],
             ),
           ) ,
        ));
  }
}
