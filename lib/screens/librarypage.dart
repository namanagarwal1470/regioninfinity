import 'package:check1/models/mathformulamodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_bar/toggle_bar.dart';
import 'package:check1/widgets/dashboardwidget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:check1/models/allmodels.dart';
import 'package:check1/models/GraphModel.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:check1/services/firestore_services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:check1/screens/pdfpage.dart';

class library_page extends StatefulWidget {
  library_page({Key? key}) : super(key: key);

  @override
  _library_pageState createState() => _library_pageState();
}

class _library_pageState extends State<library_page> {
  List<String> labels = ["Graph", 'Formulas'];
  //rgb colorcode for redcolor=(212,17,63)
  //rgb clorcode for yellowcolor=(242,185,23)
  //rgb colorcode for white=(255,255,255)

  int currentIndex = 0;
  @override
  void initState() {
    fetch_alldata();
    super.initState();
  }

  void fetch_alldata() async {
    List<GraphData> questions = await FirestoreServices().fetch_math_graphs();
    List<FormulaData> formula = await FirestoreServices().fetch_formula_data();

    setState(() {
      graph_set = questions;
      formula_set = formula;

      isloading = false;
    });
  }

  bool isloading = true;
  List<GraphData> graph_set = [];
  List<FormulaData> formula_set = [];

  @override
  Widget build(BuildContext context) {
    double? x_f = MediaQuery.of(context).size.width / 324;
    double? y_f = MediaQuery.of(context).size.height / 640;
    return Scaffold(
      backgroundColor: colortype().redcolor,
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.all(30),
                        child: Text(
                          "Library ",
                          style: TextStyle(
                              color: colortype().whitecolor, fontSize: 25),
                        )),
                    Container(
                      margin: EdgeInsets.all(30),
                      height: x_f * 30,
                      width: y_f * 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colortype().yellowcolor),
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.all(5),
                          icon: Icon(FontAwesomeIcons.times),
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                searchcontainer(context, "Search"),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            color: colortype().whitecolor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        width: double.infinity,
                        child: Column(
                          children: [
                            ToggleBar(
                              labels: labels,
                              textColor: colortype().blackcolor,
                              selectedTabColor: colortype().yellowcolor,
                              selectedTextColor: colortype().whitecolor,
                              backgroundColor: colortype().whitecolor,
                              onSelectionUpdated: (index) =>
                                  setState(() => currentIndex = index),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            currentIndex == 0 ? graphui() : formulaui()
                          ],
                        )))
              ],
            ),
    );
  }

  Widget _buildExpandableGraphTile(item) {
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

  Widget graphui() {
    return Expanded(
      child: ListView.builder(
          itemCount: graph_set.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildExpandableGraphTile(graph_set[index]);
          }),
    );
  }

  Widget formulaui() {
    return Expanded(
      child: ListView.builder(
          itemCount: formula_set.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildExpandableFormulaTile(formula_set[index]);
          }),
    );
  }

  Widget _buildExpandableFormulaTile(item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => pdfpage(item.title, item.filepath)));
      },
      child: ListTile(
        title: Text(
          item.title,
        ),
      ),
    );
  }

  
}
