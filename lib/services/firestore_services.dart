import 'package:check1/models/GraphModel.dart';
import 'package:check1/models/MathQuestion.dart';
import 'package:check1/models/mathformulamodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:check1/models/mathformulamodel.dart';

class FirestoreServices {
  Map<String, int> priority = {
    "SOC": 0,
    "MOC": 1,
    "IT": 2,
    "STATEMENT": 3,
    "PB": 4
  };
  Future<List<String>> fetch_all_topics() async {
    try {
      CollectionReference topicsdata =
          await FirebaseFirestore.instance.collection('topics');
      List<DocumentSnapshot> topicinfodocs = (await topicsdata.get()).docs;
      List<String> topics =
          topicinfodocs.map((e) => e['topic'] as String).toList();
      return topics;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<MathQuestion>> fetch_math_questions(String topic) async {
    print("fetching questions");
    try {
      Query math_questions = await FirebaseFirestore.instance
          .collection('JEE MATH Questions')
          .where("tag", isEqualTo: topic);
      CollectionReference passage_questions =
          await FirebaseFirestore.instance.collection('Passage Questions');
      List<DocumentSnapshot> math_docs = (await math_questions.get()).docs;
      List<DocumentSnapshot> passage_docs =
          (await passage_questions.get()).docs;
      print(math_docs.length);
      print(passage_docs.length);
      return assemble_question_data(math_docs, passage_docs);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  List<MathQuestion> assemble_question_data(
      List<DocumentSnapshot> math_docs, List<DocumentSnapshot> passage_docs) {
    List<MathQuestion> questions = [];
    try {
      questions = math_docs
          .map((e) => MathQuestion.fromMap(e.data() as Map, passage_docs))
          .toList();
    } catch (e) {
      print("Error in assembling questions ${e.toString()}");
    }
    questions.sort((MathQuestion a, MathQuestion b) {
      return priority[a.category]! > priority[b.category]! ? 1 : -1;
    });

    return questions;
  }

  Future<List<GraphData>> fetch_math_graphs() async {
    try {
      CollectionReference graphs =
          await FirebaseFirestore.instance.collection('GRAPHS');
      List<DocumentSnapshot> graphs_docs = (await graphs.get()).docs;
      List<GraphData> graph_data_list =
          graphs_docs.map((e) => GraphData.fromMap(e.data() as Map)).toList();
      return graph_data_list;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<FormulaData>> fetch_formula_data() async {
    try {
      CollectionReference formula =
          await FirebaseFirestore.instance.collection('Math Formulas');
      List<DocumentSnapshot> formula_docs = (await formula.get()).docs;
      List<FormulaData> formula_data_list = formula_docs
          .map((e) => FormulaData.fromMap(e.data() as Map))
          .toList();
      return formula_data_list;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
