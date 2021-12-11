import 'package:check1/models/GraphModel.dart';
import 'package:flutter/material.dart';
import 'package:check1/models/allmodels.dart';
import 'package:check1/services/firestore_services.dart';
import 'package:flutter_tex/flutter_tex.dart';

class graphspage extends StatefulWidget {
  graphspage({Key? key}) : super(key: key);

  @override
  _graphspageState createState() => _graphspageState();
}

class _graphspageState extends State<graphspage> {
  @override
  void initState() {
    fetch_graphdata();
    super.initState();
  }

  void fetch_graphdata() async {
    List<GraphData> questions = await FirestoreServices().fetch_math_graphs();

    setState(() {
      question_set = questions;
    });
  }

  List<GraphData> question_set = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colortype().whitecolor,
      body: ListView.builder(
          itemCount: question_set.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildExpandableTile(question_set[index]);
          }),
    );
  }

  Widget _buildExpandableTile(item) {
    return ExpansionTile(
      title: Text(
        item.tag,
      ),
      children: <Widget>[
        TeXView(
          child: TeXViewDocument(item.title,
              style: TeXViewStyle(
                  fontStyle: TeXViewFontStyle(fontSize: 20),
                  textAlign: TeXViewTextAlign.Center,
                  contentColor: Colors.black)),
        ),
        SizedBox(height: 20),
        TeXView(
          child: TeXViewDocument(item.description,
              style: TeXViewStyle(
                  textAlign: TeXViewTextAlign.Center,
                  contentColor: Colors.black)),
        ),
      ],
    );
  }
}
