import 'package:check1/screens/auth/loginscreen.dart';
import "package:flutter/material.dart";
import 'dart:async';
import 'package:check1/screens/onboard/start2.dart';


Widget skipbutton(BuildContext context){
  return  GestureDetector(
    onTap: () {

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => homepage()),(Route<dynamic> route) => false);
    },
    child: Container(
        margin: EdgeInsets.all(40),
        child: Text(
          "Skip",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        )),
  );
}

Widget textdata(String text,double size){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text, style: TextStyle(fontSize: size))
    ],
  );
}

Widget start1circular(){
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle),
        ),
        SizedBox(width: 10),
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle),
        ),
        SizedBox(width: 10),
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle),
        )
      ],
    ),
  );
}

Widget start2circular(){
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle),
        ),
        SizedBox(width: 10),
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle),
        ),
        SizedBox(width: 10),
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle),
        )
      ],
    ),
  );

}
Widget arrowbackbutton(BuildContext context){
  return Container(
    margin: EdgeInsets.all(40),
    child: Ink(
      decoration: ShapeDecoration(
        color: Colors.red,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {

          Navigator.pop(context);
        },
      ),
    ),
  );

}

Widget start3circular(){
  return  Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle),
        ),
        SizedBox(width: 10),
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle),
        ),
        SizedBox(width: 10),
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle),
        )
      ],
    ),
  );
}