import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget crossicon(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        margin: EdgeInsets.all(20),
        height: 40,
        width: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
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

Widget text_widget(String text, double size) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.white, fontSize: size, fontWeight: FontWeight.bold),
  );
}

Widget container_widget(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 20, left: 10, right: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40), color: Colors.grey[300]),
    width: (MediaQuery.of(context).size.width) * 0.9,
    height: 300,
  );
}
