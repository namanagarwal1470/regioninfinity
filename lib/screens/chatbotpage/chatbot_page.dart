import 'package:check1/models/MathQuestion.dart';
import 'package:check1/screens/chatbotpage/math_rendering/questionrendering.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:check1/widgets/queswidgets.dart';
import 'package:check1/services/firestore_services.dart';


class ChatBotPage extends StatefulWidget {
  String topicname = '';
  ChatBotPage(this.topicname);
  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  bool volumeup = true;
  bool isloading = true;
  List<MathQuestion> question_set = [];
  int z = 0;
  bool issolutionshow = true;
  @override
  void initState() {
    fetch_questions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double? x_f = MediaQuery.of(context).size.width/324;
    double? y_f = MediaQuery.of(context).size.height/640;
    return Scaffold(
      backgroundColor: Colors.red,
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : question_set.length==0?Center(child: Text("NO question here"),):Padding(
            padding: EdgeInsets.only(top: 28*y_f),
            child: Column(
                children: [
                  // total height  640
                  // padding 30 (safe area)
                  // appbar 20 + 30
                  // white container 415
                  // teach bot 100
                  // volume controller 45
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10*x_f),
                    child: appbardatas(context, widget.topicname),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10*x_f,vertical: 10*y_f),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Manipulation",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        changemethodbutton(x_f,y_f),
                      ],
                    ),
                  ),
                   SizedBox(height: 10*y_f),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10*y_f,),
                        question_navigation_layer(z,x_f,y_f),
                        Container(
                          height: y_f*340,
                          child: QuestionRendering(question: question_set[z],)
                        ),
                      ],
                    ),
                  ),
                  teachbotcontainer(x_f,y_f),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10*x_f),
                    child: bottom_layer(y_f)
                  )

                ],
              ),
          ),
    );
  }
  Widget bottom_layer(double y_f) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(FontAwesomeIcons.edit),
          iconSize: 18*y_f,
          color: Colors.white,
          onPressed: () {
            setState(() {
              print("hello");
            });
          },
        ),
        IconButton(
          icon: Icon(volumeup ? Icons.volume_up : Icons.volume_off),
          iconSize: 18*y_f,
          color: Colors.white,
          onPressed: () {
            setState(() {
              volumeup ? volumeup = false : volumeup = true;
            });
          },
        ),
      ],
    );
  }
  void fetch_questions() async {
    List<MathQuestion> questions =
        await FirestoreServices().fetch_math_questions(widget.topicname);
    print(questions.length);

    setState(() {
      question_set = questions;
      isloading = false;
    });
  }

  Widget question_navigation_layer(int counter,double x_f, double y_f) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (counter <= 0) {
                setState(() {
                  z = 0;
                });
              } else {
                setState(() {
                  z = counter - 1;
                });
              }
            },
            child: Container(
                child: Icon(Icons.arrow_back_ios,color: Colors.red,size: 25*y_f,)
            ),
          ),
          Text(
            "Question : ${z + 1}",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18*x_f,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              if (counter >= (question_set.length) - 1) {
                setState(() {
                  z = (question_set.length) - 1;
                });
              } else {
                setState(() {
                  z = counter + 1;
                });
              }
            },
            child: Container(
              child: Icon(Icons.arrow_forward_ios,color: Colors.red,size: 25*y_f,)
            ),
          )
        ],
      ),
    );
  }

}
