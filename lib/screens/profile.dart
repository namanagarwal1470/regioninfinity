import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:check1/widgets/profilewidget.dart';
import 'package:check1/widgets/profilewidget.dart';

class profilePage extends StatefulWidget {
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  String name = '';
  String phone = '';
  String email = '';
  String classes = '';
  String school = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: (MediaQuery.of(context).size.height) * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(80))),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                width: double.infinity,
                height: (MediaQuery.of(context).size.height) * 0.5,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(90))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    crossicon(context),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.1),
                    text_widget(name, 30),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.03),
                    text_widget("Phone: " + phone, 20),
                    text_widget("Email: " +  email, 20),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.03),
                    text_widget("Class : " +  classes, 20),
                    text_widget("School: " +  school, 20),
                  ],
                ),
              )),
          Expanded(
            child: Container(
              height: (MediaQuery.of(context).size.height) * 0.4,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  container_widget(context),
                  container_widget(context),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
