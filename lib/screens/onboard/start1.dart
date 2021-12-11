import 'package:check1/widgets/startpageswidgets.dart';
import "package:flutter/material.dart";
import 'dart:async';
import 'package:check1/screens/onboard/start2.dart';

class start1 extends StatefulWidget {
  start1({Key? key}) : super(key: key);

  @override
  _start1State createState() => _start1State();
}

class _start1State extends State<start1> {

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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                skipbutton(context),
              ],
            ),
            SizedBox(height: 180),
            textdata("Solve your mathematical", 30),
            textdata("problems in seconds", 25),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Lorem ipsum dolor sit amet,conetetur sadipscing elitr \n sed diam nonumy eirmod tempor invidunt ut laboure et \n dolore magna aliquyam erat ,sed diam voluptua, at vero",
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
                              child: start1circular()
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
                MaterialPageRoute(builder: (context) => start2()));
          },
        ),
      ),
    );
  }
}
