import 'package:check1/models/user_model.dart';
import "package:flutter/material.dart";
import 'package:check1/screens/chatbotpage/chatbot_page.dart';
import 'package:check1/screens/topics.dart';
import 'package:check1/screens/profile.dart';
import 'package:check1/widgets/dashboardwidget.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:check1/services/sharedPref.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late UserModel user;

  @override
  void initState() {
    SharedPref().fetch_user_local().then((value) {
      setState(() {
        user = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: Drawer(child: draweritems(context)),
            appBar: AppBar(
              elevation: 0,
              title: appbardata(context, user),
              backgroundColor: Colors.red,
            ),
            body: ListView(
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height) * 0.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        searchcontainer(context, "Search for topics"),
                        startlearningcontainer(context),
                      ]),
                ),
                SizedBox(height: 50),
                recentsearches(),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: (MediaQuery.of(context).size.height) * 0.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        cont("75%", "Coordinate Geometry \n Class - 12",
                            context),
                        SizedBox(height: 10),
                        cont("25%", "Relations & Functions\n Class - 12",
                            context),
                        SizedBox(height: 10),
                        cont("100%", "Algebra \n Class - 12", context),
                        SizedBox(height: 10),
                        cont(
                            "50%", "Matrix Calculation \n Class - 12", context),
                        SizedBox(height: 10),
                        cont("75%", "Trees & Graphs \n Class-12", context),
                        SizedBox(height: 10),
                        cont("75%", "Coordinate Geometry \n Class - 12",
                            context),
                        SizedBox(height: 10),
                        cont("25%", "Relations & Functions\n Class - 12",
                            context),
                        SizedBox(height: 10),
                        cont("100%", "Algebra \n Class - 12", context),
                        SizedBox(height: 10),
                        cont(
                            "50%", "Matrix Calculation \n Class - 12", context),
                        SizedBox(height: 10),
                        cont("75%", "Trees & Graphs \n Class-12", context)
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
