import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget toprowdata(BuildContext context){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "How to use? ",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )),
      Container(
        margin: EdgeInsets.all(20),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.yellow),
        child: Center(
          child: IconButton(
            padding: EdgeInsets.all(5),
            icon: Icon(FontAwesomeIcons.times),
            color: Colors.red,
            onPressed: () {
                Navigator.pop(context);
            },
          ),
        ),
      ),
    ],
  );
}

Widget photocontainer(BuildContext context){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.white),
          child: Center(
            child: IconButton(
              padding: EdgeInsets.all(5),
              icon: Icon(FontAwesomeIcons.play),
              iconSize: 20,
              color: Colors.red,
              onPressed: () {

                  print("hello");

              },
            ),
          ),
        ),
      ],
    ),
    margin:
    EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.yellow),
    width: (MediaQuery.of(context).size.width) * 0.8,
    height: 300,
  );
}