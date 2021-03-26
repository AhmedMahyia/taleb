import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleGridViewItem extends StatelessWidget {
  final String name;
  final String pictureName;
  final Function onTaped;
  SingleGridViewItem({this.name, this.pictureName, this.onTaped});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration( color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: onTaped,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              pictureName,
              height: 90,
              // fit: BoxFit.cover,
            ),
            Container(
             //   decoration: BoxDecoration( color: Colors.blue),
                child: Center(
                    child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ))),
          ],
        ),
      ),
    );
  }
}
