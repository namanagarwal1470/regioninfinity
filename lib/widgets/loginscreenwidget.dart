import 'package:flutter/material.dart';
import 'package:check1/screens/auth/otpscreen.dart';

Widget headline() {
  return Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child: Text(
          "Hello! Champion",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ));
}

Widget mobilenumbercontainer(
    TextEditingController mobilecontroller, BuildContext context) {
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
          "+91",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        SizedBox(width: 15),
        Container(
            width: (MediaQuery.of(context).size.width) * 0.5,
            height: 30,
            child: TextField(
              style: TextStyle(fontSize: 20),
              controller: mobilecontroller,
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

Widget loginbutton(
    BuildContext context, TextEditingController mobilecontroller) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => OtpPage(int.parse(mobilecontroller.text))),
      );
    },
    child: Container(
      child: Center(
        child: Text(
          "Login",
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

Widget forgotpassword() {
  return Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child: Text(
          "Forget Password?",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ));
}
