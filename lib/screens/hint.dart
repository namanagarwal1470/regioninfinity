import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:check1/widgets/hintwidgets.dart';

class hint extends StatefulWidget {
  hint({Key? key}) : super(key: key);

  @override
  _hintState createState() => _hintState();
}

class _hintState extends State<hint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Column(children: [
            toprowdata(context),
            Container(
              height: (MediaQuery.of(context).size.height) * 0.4,
              width: double.infinity,
              child: photocontainer(context),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(60))),
            )
          ]),
          Expanded(
            child: Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height) * 0.5,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("How to use?",
                        style: TextStyle(color: Colors.red, fontSize: 30)),
                    SizedBox(height: 15),
                    Text("sit ame \n hello\nghkh",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    SizedBox(height: 15),
                    Text("Step 1",
                        style: TextStyle(color: Colors.red, fontSize: 25)),
                    SizedBox(height: 15),
                    Text("At vero\neteznoseajhddj",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    SizedBox(height: 15),
                    Text("Step 2",
                        style: TextStyle(color: Colors.red, fontSize: 25)),
                    SizedBox(height: 15),
                    Text("At vero \n et ez no \n seajhddj",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    SizedBox(height: 15),
                    Text("Step 3",
                        style: TextStyle(color: Colors.red, fontSize: 25)),
                    SizedBox(height: 15),
                    Text("At vero \n et ez no \n seajhddj",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
