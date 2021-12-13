import 'package:check1/models/allmodels.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:check1/models/allmodels.dart';

class pdfpage extends StatefulWidget {
  String title = '';
  String filepath = '';
  pdfpage(this.title, this.filepath);

  @override
  _pdfpageState createState() => _pdfpageState();
}

class _pdfpageState extends State<pdfpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colortype().redcolor,
          title: Text(widget.title),
        ),
        body: Container(child: SfPdfViewer.network(widget.filepath)));
    ;
  }
}
