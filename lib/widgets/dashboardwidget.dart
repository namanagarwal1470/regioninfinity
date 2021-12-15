import 'package:check1/models/user_model.dart';
import 'package:check1/services/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:check1/screens/topics.dart';
import 'package:check1/screens/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:check1/screens/auth/loginscreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:check1/models/allmodels.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:check1/services/url_services.dart';

Widget draweritems(BuildContext context) {
  return ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: BoxDecoration(color: colortype().redcolor),
        child: Center(
            child: Text(
          'Region Infinity',
          style: TextStyle(
              color: colortype().whitecolor,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        )),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => profilePage()));
        },
        child: ListTile(
          title: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: colortype().whitecolor),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.all(5),
                    icon: Icon(FontAwesomeIcons.user),
                    color: colortype().redcolor,
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      ListTile(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(10),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: colortype().whitecolor),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.all(5),
                    icon: Icon(FontAwesomeIcons.exclamationCircle),
                    color: colortype().redcolor,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Privacy policies',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      ListTile(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(10),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: colortype().whitecolor),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.all(5),
                    icon: Icon(FontAwesomeIcons.infoCircle),
                    color: colortype().redcolor,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Text(
              'About us',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      ListTile(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(10),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: colortype().whitecolor),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.all(5),
                    icon: Icon(FontAwesomeIcons.users),
                    color: colortype().redcolor,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Contact us',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      ListTile(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
               play_store();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: colortype().whitecolor),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.all(5),
                    icon: Icon(FontAwesomeIcons.star),
                    color: colortype().redcolor,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Rate us',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: ()  {
         SharedPref().removeuser(context);
        },
        child: ListTile(
          title: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: colortype().whitecolor),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.all(5),
                    icon: Icon(FontAwesomeIcons.usersSlash),
                    color: colortype().redcolor,
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Log out',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget appbardata(BuildContext context, UserModel user) {
  if (user == Null)
    return Center(
      child: CircularProgressIndicator(),
    );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Hi," + user.name!,
          style: TextStyle(
              color: colortype().whitecolor,
              fontWeight: FontWeight.bold,
              fontSize: 20)),
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: colortype().whitecolor),
        child: Center(
          child: IconButton(
            padding: EdgeInsets.all(5),
            icon: Icon(Icons.verified_sharp),
            iconSize: 15,
            color: colortype().redcolor,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => profilePage()));
            },
          ),
        ),
      ),
    ],
  );
}

Widget searchcontainer(BuildContext context, String label_text) {
  return Container(
    padding: EdgeInsets.only(top: 5, bottom: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: colortype().whitecolor),
    width: (MediaQuery.of(context).size.width) * 0.9,
    height: 45,
    child: Row(
      children: [
        SizedBox(width: 20),
        Text(
          "",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        SizedBox(width: 20),
        Container(
            width: (MediaQuery.of(context).size.width) * 0.65,
            height: 35,
            child: Center(
              child: TextField(
                style: TextStyle(fontSize: 20, decorationThickness: 0.0),
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: label_text),
              ),
            )),
        Container(
          child: Ink(
            decoration: ShapeDecoration(
              color: colortype().whitecolor,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(FontAwesomeIcons.search),
              color: Colors.grey[300],
              onPressed: () {
                print("hello");
              },
            ),
          ),
        ),
      ],
    ),
  );
}

Widget startlearningcontainer(BuildContext context) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: colortype().whitecolor),
      width: (MediaQuery.of(context).size.width) * 0.9,
      height: (MediaQuery.of(context).size.height) * 0.4 * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.height) * 0.4 * 0.6 * 0.2,
                  left: (MediaQuery.of(context).size.width) * 0.9 * 0.1 * 0.6),
              child: Text("Afraid from Maths",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20))),
          Container(
              margin: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.height) *
                      0.4 *
                      0.6 *
                      0.2 *
                      0.1,
                  left: (MediaQuery.of(context).size.width) * 0.9 * 0.1 * 0.6),
              child: Text("Now its easy!",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20))),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TopicsPage()));
              },
              child: Container(
                child: Center(
                  child: Text(
                    "Start Learning",
                    style:
                        TextStyle(color: colortype().whitecolor, fontSize: 15),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.yellow),
                width: 150,
                height: (MediaQuery.of(context).size.height) * 0.4 * 0.2 * 0.5,
                margin: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.height) * 0.05,
                  left: (MediaQuery.of(context).size.width) * 0.9 * 0.1 * 0.6,
                  bottom: (MediaQuery.of(context).size.height) *
                      0.4 *
                      0.6 *
                      0.2 *
                      0.4,
                ),
              )),
        ],
      ));
}

Widget recentsearches() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(width: 30),
      GestureDetector(
        onTap: () {
          print("hello");
        },
        child: Container(
          height: 20,
          color: Colors.white,
          child: Text(
            "Recent Searches",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    ],
  );
}

Widget cont(String text, String text2, BuildContext context) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colors.red),
      width: (MediaQuery.of(context).size.width) * 0.9,
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 20),
          Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Center(
              child: Container(
                height: 30,
                width: 30,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            height: 45,
            width: (MediaQuery.of(context).size.width) * 0.6 * 0.9,
            color: Colors.red,
            child: Text(
              text2,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.all(5),
                icon: Icon(Icons.arrow_forward),
                color: Colors.red,
                onPressed: () {
                  print("hello");
                },
              ),
            ),
          ),
        ],
      ));
}
