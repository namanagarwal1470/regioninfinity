import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:check1/screens/hint.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:check1/screens/librarypage.dart';

Widget appbardatas(BuildContext context, String text) {
  double? x_f = MediaQuery.of(context).size.width / 324;
  double? y_f = MediaQuery.of(context).size.height / 640;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      Container(
        child: Row(
          children: [
            Container(
              height: 25 * x_f,
              width: 25 * x_f,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.all(5),
                  icon: Icon(FontAwesomeIcons.question),
                  iconSize: 15 * x_f,
                  color: Colors.red,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => hint()));
                  },
                ),
              ),
            ),
            SizedBox(width: 7),
            Container(
              height: 30 * x_f,
              width: 30 * x_f,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.all(5),
                  icon: Icon(FontAwesomeIcons.book),
                  iconSize: 20 * x_f,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => library_page()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget changemethodbutton(double x_f, double y_f) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8 * x_f, vertical: 8 * y_f),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Center(
      child: Text(
        "Change Method",
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    ),
  );
}

Widget teachbotcontainer(double xf, double yf) {
  return Container(
    color: Colors.white54,
    height: 100 * yf,
    child: Column(
      children: [
        Text(
          "Teach Bot",
          style: TextStyle(fontSize: 24 * yf, fontWeight: FontWeight.w500),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: IconButton(
                padding: EdgeInsets.all(5),
                icon: Icon(Icons.arrow_back_outlined),
                color: Colors.white,
                onPressed: () {
                  print("hello");
                },
              ),
            ),
            Expanded(
              child: Text(
                "dolores et ea stet kasd bd sanctus dolor sit lorem ipsumconseteur sed",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: IconButton(
                padding: EdgeInsets.all(5),
                icon: Icon(Icons.arrow_forward_outlined),
                color: Colors.white,
                onPressed: () {
                  print("hello");
                },
              ),
            ),
          ],
        )
      ],
    ),
  );
}
