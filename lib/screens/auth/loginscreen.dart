import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:check1/screens/auth/otpscreen.dart';
import 'package:check1/widgets/loginscreenwidget.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController _controller = TextEditingController();

  final otpnumber = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          height: (MediaQuery.of(context).size.height) * 0.6,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
          child: ListView(
            children: [
              SizedBox(height: 130),
              headline(),
              SizedBox(height: 20),
              mobilenumbercontainer(_controller, context),
              SizedBox(height: 20),
              loginbutton(context, _controller),
              forgotpassword(),
            ],
          ),
        ),
      ],
    ));
  }
}
