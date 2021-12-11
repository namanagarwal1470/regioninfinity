import 'package:check1/models/MathQuestion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class QuestionRendering extends StatefulWidget {
  final MathQuestion question;

  QuestionRendering({required this.question});

  @override
  _QuestionRenderingState createState() => _QuestionRenderingState();
}

class _QuestionRenderingState extends State<QuestionRendering> {
  bool issolutionshow = true;

  @override
  Widget build(BuildContext context) {
    String type = widget.question.category;
    double? x_f = MediaQuery.of(context).size.width / 324;
    double? y_f = MediaQuery.of(context).size.height / 640;
    return SingleChildScrollView(
      child: Column(
        children: [
          TeXView(
            style:
                TeXViewStyle(padding: TeXViewPadding.only(left: 10, right: 10)),
            child: TeXViewColumn(children: [
              //question area

              type == 'SOC' || type == 'MOC'
                  ? MCQRendering(widget.question.Questions)
                  : type == 'IT' || type == 'STATEMENT'
                      ? IntegerQuestionR()
                      : type == 'PB'
                          ? PassageBasedRendering()
                          : TeXViewDocument(""),


            ]),
            // child: (widget.question.category == "SOC") ||
            //     (widget.question.category == "MOC")
            //     ? MCQRender(question: widget.question, isshowsolution: issolutionshow):Container()
            // : (widget.question.category == "IT")
            // ? integerui()
            // : (widget.question.category == "PB")
            // ? pbui()
            // : integerui(),
          ),
          issolutionshow
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          issolutionshow = true;
                        });
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text("Solution",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))),
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }

  TeXViewColumn MCQRendering(var mcq_question) {
    String image = mcq_question.image;
    return TeXViewColumn(
      children: [
        TeXViewDocument( "Multiple Choice Question",
            style: TeXViewStyle(
                textAlign: TeXViewTextAlign.Center,
                padding: TeXViewPadding.only(top: 10, bottom: 10),
                contentColor: Colors.black)),
        TeXViewDocument(mcq_question.title,
            style: TeXViewStyle(
                textAlign: TeXViewTextAlign.Center,
                padding: TeXViewPadding.only(top: 10, bottom: 10),
                contentColor: Colors.black)),
        image!=null&&image!=""?TeXViewImage.network(image):TeXViewDocument(""),

        TeXViewColumn(
            children: List.generate(
          mcq_question.options.length,
          (index) => TeXViewDocument(
            "(" + (index + 1).toString() + ")" + mcq_question.options[index],
            style: TeXViewStyle(
                textAlign: TeXViewTextAlign.Left, contentColor: Colors.black),
          ),
        )),
        //solution area
        TeXViewDocument(!issolutionshow ? "" : "Solution",
            style: TeXViewStyle(
                padding: TeXViewPadding.only(top: 10, bottom: 10))),
        Image_container(mcq_question.solution_images),
        TeXViewDocument(
            !issolutionshow ? "" : mcq_question.solution)
      ],
    );
  }

  TeXViewColumn PassageBasedRendering() {
    return TeXViewColumn(children: [
      TeXViewDocument("Passage Based Type",
          style: TeXViewStyle(
              textAlign: TeXViewTextAlign.Center,
              padding: TeXViewPadding.only(top: 10, bottom: 10),
              contentColor: Colors.black)),
      TeXViewDocument(widget.question.instruction,
          style: TeXViewStyle(
              textAlign: TeXViewTextAlign.Center,
              padding: TeXViewPadding.only(top: 10, bottom: 10),
              contentColor: Colors.black)),
      TeXViewColumn(
        children: List.generate(widget.question.Questions.sub_questions.length,
            (index) => MCQRendering(widget.question.Questions.sub_questions[index])),
      ),
    ]);
  }

  TeXViewColumn IntegerQuestionR() {
    String image = widget.question.Questions.image;
    return TeXViewColumn(children: [
    TeXViewDocument(widget.question.category=='IT'?"SINGLE DIGIT INTEGER TYPE":"STATEMENT TYPE",
        style: TeXViewStyle(
            textAlign: TeXViewTextAlign.Center,
            padding: TeXViewPadding.only(top: 10, bottom: 10),
            contentColor: Colors.black)),
    TeXViewDocument(widget.question.Questions.title,
        style: TeXViewStyle(
            textAlign: TeXViewTextAlign.Center,
            padding: TeXViewPadding.only(top: 10, bottom: 10),
            contentColor: Colors.black)),
      image!=null&&image!=""?TeXViewImage.network(image):TeXViewDocument(""),
      //solution area
      TeXViewDocument(!issolutionshow ? "" : "Solution",
          style: TeXViewStyle(
              padding: TeXViewPadding.only(top: 10, bottom: 10))),
      Image_container(widget.question.Questions.solution_images),
      TeXViewDocument(
          !issolutionshow ? "" : widget.question.Questions.solution)
    ]);
  }
  TeXViewColumn Image_container(List<String> images){
    if(images==null||issolutionshow==false)
      images =[];
    return TeXViewColumn(children: List.generate(images.length, (index) => TeXViewImage.network(images[index])));
  }

}
