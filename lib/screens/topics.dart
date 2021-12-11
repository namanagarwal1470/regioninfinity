import 'package:check1/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:check1/screens/chatbotpage/chatbot_page.dart';
class TopicsPage extends StatefulWidget {
  TopicsPage({Key? key}) : super(key: key);

  @override
  _TopicsPageState createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  List topicsnames = [];
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    fetch_topics();

  }

  fetch_topics() async {
    List<String> all_topics = await FirestoreServices().fetch_all_topics();
    setState(() {
      topicsnames = all_topics;
      print(all_topics);
      isloading = false;
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: isloading
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height) * 0.1,
                    margin: EdgeInsets.only(left: 50, top: 30),
                    child: Text("Select Topics",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: ListView.builder(
                            itemCount: topicsnames.length,
                            itemBuilder: (context, index) {
                              return Cont(topicsnames[index]);
                            })),
                  ),
                ],
              ));
  }

  Widget Cont(String text1) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatBotPage(text1)));
      },
      child: Container(
          height: 60,
          margin: EdgeInsets.only(left: 15, right: 15, top: 30),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(40)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  text1,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ],
          )),
    );
  }
}
