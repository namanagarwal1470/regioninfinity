import 'package:check1/screens/auth/register_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:check1/services/auth_services.dart';
import 'package:check1/screens/auth/otpscreen.dart';
import 'package:check1/widgets/loginscreenwidget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:check1/screens/dashboard.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController _controller = TextEditingController();

  final otpnumber = TextEditingController();

  var firebaseAuth = FirebaseAuth.instance;
  String? verificationId;
  var loggedIn = false;

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
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Social media login",
              style: TextStyle(color: Colors.black, fontSize: 20),
            )
          ],
        ),
        SizedBox(height: 20),
        socialloginbutton(),
      ],
    ));
  }

  void initiateSignIn(String type) {
    AuthService().SocialhandleSignIn(type).then((result) {
      if (result == 1) {
        setState(() {
          loggedIn = true;
          AuthService().handle_signin(context);
        });
      } else {}
    });
  }

  Widget socialloginbutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              initiateSignIn('G');
            },
            child: Image(
                width: 30,
                height: 30,
                image: AssetImage('assets/images/google.png'))),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            initiateSignIn('FB');
          },
          child: Image(
              width: 30,
              height: 30,
              image: AssetImage('assets/images/facebook.png')),
        ),
      ],
    );
  }
}
