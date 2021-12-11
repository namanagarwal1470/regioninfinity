import "package:flutter/material.dart";
import 'package:check1/screens/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget detailscontainer(String text,TextEditingController control){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(color: Colors.grey)),
    width: 280,
    height: 40,
    margin: EdgeInsets.only(right: 50, left: 50),
    child: Row(
      children: [
        SizedBox(width: 20),
        Text(
          "",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        SizedBox(width: 15),
        Container(
            width: 200,
            height: 30,
            child: TextField(
              controller: control,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: text,
                contentPadding: EdgeInsets.only(bottom: 17),
                border: InputBorder.none,
              ),
            )),
      ],
    ),
  );
}