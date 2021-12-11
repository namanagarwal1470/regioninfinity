import 'package:check1/models/user_model.dart';
import 'package:check1/services/auth_services.dart';
import 'package:check1/services/sharedPref.dart';
import "package:flutter/material.dart";
import 'package:check1/screens/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:check1/widgets/dtailspagewidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterDetails extends StatefulWidget {
  @override
  _RegisterDetailsState createState() => _RegisterDetailsState();
}

class _RegisterDetailsState extends State<RegisterDetails> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController name = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController examname = TextEditingController();
  TextEditingController schoolname = TextEditingController();
  TextEditingController classes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  "Basic Details",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              )),
          height: 200,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 100),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        ),
        detailscontainer("Name", name),
        SizedBox(height: 25),
        detailscontainer("Date of Birth", dob),
        SizedBox(height: 25),
        detailscontainer("Email", email),
        SizedBox(height: 25),
        detailscontainer("Exam name", examname),
        SizedBox(height: 25),
        detailscontainer("School name", schoolname),
        SizedBox(height: 25),
        detailscontainer("Class", classes),
        SizedBox(height: 105),
        submitbutton(),
      ],
    ));
  }

  Widget submitbutton() {
    return GestureDetector(
      onTap: () async{
        if (name.text != '' &&
            dob.text != '' &&
            email.text != '' &&
            examname.text != '' &&
            schoolname.text != '' &&
            classes.text != '') {
          UserModel user = UserModel(
            name: name.text,
            email: email.text,
            school: schoolname.text,
            class_of_study: classes.text,
            phone:  "",
          );
          SharedPref().add_user(user);
            AuthService().update_user(user);

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => DashboardPage()),
              (Route<dynamic> route) => false);
        }
      },
      child: Container(
        child: Center(
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.yellow),
        width: double.infinity,
        height: 40,
        margin: EdgeInsets.only(right: 50, left: 50, bottom: 100),
      ),
    );
  }
}
