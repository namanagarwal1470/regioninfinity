import "package:flutter/material.dart";
import 'dart:async';
import 'package:check1/screens/onboard/start1.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:check1/screens/dashboard.dart';

class splash extends StatefulWidget {
  splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {

  String name = '';
  String phone = '';
  String email = '';
  String classes = '';
  String school = '';
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return Timer(duration, isuserroute);
  }

  isuserroute() async {
    try{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      name = await (prefs.getString('name') ?? '');
      phone = (prefs.getString('phone') ?? '');
      email = (prefs.getString('email') ?? '');
      classes = (prefs.getString('classes') ?? '');
      school = (prefs.getString('school') ?? '');
      name == ''
          ? Navigator.push(
          context, MaterialPageRoute(builder: (context) => start1()))
          : Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DashboardPage()),
              (Route<dynamic> route) => false);
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.red,
            body: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: (MediaQuery.of(context).size.height) * 0.3,
                      width: (MediaQuery.of(context).size.width) * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(400))),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: (MediaQuery.of(context).size.height) * 0.4,
                        width: (MediaQuery.of(context).size.width),
                        child: Center(
                          child: Text(
                            "Region Infinity",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                        color: Colors.red)
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: (MediaQuery.of(context).size.width) * 0.5),
                    Container(
                      height: (MediaQuery.of(context).size.height) * 0.3,
                      width: (MediaQuery.of(context).size.width) * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(400))),
                    )
                  ],
                )
              ],
            )));
  }
}
