import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String photo;
  final String text;
  final Function onTaped;
  const ContactItem({this.photo,this.text,this.onTaped}) ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaped,
      child:               Card(
        color: Colors.white24,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListTile(
          leading: Image.asset(photo,height: 50,width: 50,),
          title: Text(
            text,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
