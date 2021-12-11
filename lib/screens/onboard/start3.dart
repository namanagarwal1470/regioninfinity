import "package:flutter/material.dart";
import 'dart:async';
import 'package:check1/screens/auth/loginscreen.dart';
import 'package:check1/widgets/startpageswidgets.dart';

class start3 extends StatefulWidget {
  start3({Key? key}) : super(key: key);

  @override
  _start3State createState() => _start3State();
}

class _start3State extends State<start3> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                arrowbackbutton(context),

              ],
            ),
            SizedBox(height: 180),
            textdata("Easy tips and tricks for", 25),
            textdata("better understanding", 25),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "voluptua, At vero eos et accusam et justo duo dolores et \n ea rebum.Stet clita kasd gubergren, no sea takimata\n sanctus est Lorem ipsum dolor sit amet ",
                    style: TextStyle(fontSize: 12, color: Colors.grey))
              ],
            ),
            SizedBox(height: 20),
            arrowforwardbutton(),
            SizedBox(height: 20),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(120),
                            topRight: Radius.circular(120))),
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(top: 5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(130),
                                      topRight: Radius.circular(130))),
                              child:start3circular()
                          ),
                        )
                      ],
                    )))
          ],
        )));
  }
  Widget arrowforwardbutton(){
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.all(5),
          icon: Icon(Icons.arrow_forward),
          color: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => homepage()));
          },
        ),
      ),
    );
  }
}
