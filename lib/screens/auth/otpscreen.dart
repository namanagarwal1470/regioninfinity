import 'package:check1/screens/auth/register_details.dart';
import 'package:check1/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:check1/screens/chatbotpage/chatbot_page.dart';
import 'package:check1/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:check1/widgets/otpscreenwidget.dart';

import 'package:shared_preferences/shared_preferences.dart';

class OtpPage extends StatefulWidget {
  final int phoneno;
  OtpPage(this.phoneno);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _verificationID = '';
  String name = '';
  String phone = '';
  String email = '';
  String classes = '';
  String school = '';
  int counter = 0;
  bool m = false;
  final TextEditingController _pinPutController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: ListView(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height) * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50))),
              child: ListView(
                children: [
                  SizedBox(height: 130),
                  headline(),
                  SizedBox(height: 20),
                  otpcontainer(_pinPutController, context),
                  SizedBox(height: 20),
                  submitbutton(_verificationID, _pinPutController,context),
                  otpresend()
                ],
              ),
            ),
          ],
        ));
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phoneno}',
        verificationCompleted: (PhoneAuthCredential authCredential) async {
          await FirebaseAuth.instance
              .signInWithCredential(authCredential)
              .then((value) async {
            if (value.user != null) {
                AuthService().handle_signin(context);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },

        codeSent: (String verID, int? forceCodeResend) {
          setState(() {
            _verificationID = verID;
          });
        },
        codeAutoRetrievalTimeout: (String verID) {
          setState(() {
            _verificationID = verID;
          });
        },
        timeout: Duration(seconds: 10));
  }

}
