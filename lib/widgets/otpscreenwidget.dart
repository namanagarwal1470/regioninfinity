
import 'package:check1/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget headline() {
  return Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child: Text(
          "Enter OTP",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ));
}

Widget otpcontainer(TextEditingController otpcontroller, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.white),
    width: double.infinity,
    height: 40,
    margin: EdgeInsets.only(right: 50, left: 50),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 20),
        Text(
          "",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        SizedBox(width: 15),
        Container(
            width: (MediaQuery.of(context).size.width) * 0.5,
            height: 30,
            child: TextField(
              style: TextStyle(fontSize: 20),
              controller: otpcontroller,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ))
      ],
    ),
  );
}

Widget submitbutton(
    String verificationid,
    TextEditingController otpcontroller,BuildContext context
    ) {
  return GestureDetector(
    onTap: () async {
      await FirebaseAuth.instance
          .signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationid, smsCode: otpcontroller.text),
      )
          .then((value) async {
        if (value.user != null) {
          AuthService().handle_signin(context);
        }
      });
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
      margin: EdgeInsets.only(right: 50, left: 50),
    ),
  );
}

Widget otpresend() {
  return Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child: Text(
          "Haven't recieved OTP Resend",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ));
}
