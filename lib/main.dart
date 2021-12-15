import 'package:check1/screens/auth/loginscreen.dart';
import 'package:check1/screens/dashboard.dart';
import 'package:check1/screens/graphs.dart';
import 'package:check1/screens/topics.dart';
import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:check1/screens/librarypage.dart';
import 'package:check1/screens/onboard/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: DashboardPage());
  }
}
