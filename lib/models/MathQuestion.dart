import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
//Categories
//SOC => SINGLE OPTION CORRECT
//MOC => MULTIPLE OPTION CORRECT
//IT => INTEGER BASED CORRECT
//PB => PASSAGE BASED
//STATEMENT => STATEMENT TYPE QUESTION

// class MathQuestionClassifiedList {
//   List<SOC_Question> SOC=[];
//   List<MOC_Question> MOC=[];
//   List<IT_Question> IT=[];
//   List<PB_Question> PB=[];
//   List<STATEMENT_Question> STATEMENT=[];
//   MathQuestionClassifiedList({required this.IT,required this.MOC,required this.PB,required this.SOC,required this.STATEMENT});
//   factory MathQuestionClassifiedList.fromSET(List<MathQuestion> questions){
//
//     return MathQuestionClassifiedList(IT: questions.where((element) => element.category=="MOC"), MOC: MOC, PB: PB, SOC: SOC, STATEMENT: STATEMENT)
//   }
// }



class MathQuestion {
  late String category;
  late String instruction;
  late var Questions;
  MathQuestion({required this.category,required this.instruction,this.Questions});
   factory MathQuestion.fromMap(var map,List<DocumentSnapshot> passage_snapshot){
   String tp = map['category']??"";
  return MathQuestion(
    category:tp,
    instruction: map['instruction']??"",
    Questions: tp=="SOC"?SOC_Question.fromMap(map['questions']):tp=='MOC'?MOC_Question.fromMap(map['questions']):tp=='IT'?IT_Question.fromMap(map['questions']):
    tp=='STATEMENT'?STATEMENT_Question.fromMap(map['questions']) :tp=='PB'?PB_Question.fromMap(map,passage_snapshot):null

    ) ;
  }
}

class SOC_Question{
  late String title;
  late String image;
  late String solution;
  late List<String> solution_images;
  late List<String> options;
  late int answer;

  SOC_Question({required this.image,required this.solution_images,required this.title,required this.solution,required this.options,required this.answer});
  factory SOC_Question.fromMap(var map){
    return SOC_Question(
      title :map['title']??"",
      image: map['question_image']??"",
      solution: map['solution']??"",
      options: List.castFrom(map['options']),
      answer: map['answer']??-1,
      solution_images:List.castFrom(map['solution_image']??[]),
    );
  }
}
class MOC_Question{
  late String title;
  late String image;
  late String solution;
  late List<String> options;
  late List<String> solution_images;
  late List<int> answer;
  MOC_Question({required this.image,required this.solution_images,required this.title,required this.solution,required this.options,required this.answer});
  factory MOC_Question.fromMap(Map<String,dynamic> map){
    return MOC_Question(
        title :map['title']??"",
        image: map['question_image']??"",
        solution: map['solution']??"",
         options: List.castFrom(map['options']),
        answer: List.castFrom(map['answer']),
      solution_images:List.castFrom(map['solution_image']??[]),
    ) ;
  }
}
class PB_Question{
  late List<SOC_Question> sub_questions;
  late String tag;
  PB_Question({required this.sub_questions,required this.tag});
  factory PB_Question.fromMap(Map<String,dynamic> map,List<DocumentSnapshot> passage_snapshot){

    List question_ids = map['questions'].map((e)=>e.toString()).toList();
    return PB_Question(
      tag: map['tag']??"",
      sub_questions: (question_ids).map((e) => SOC_Question.fromMap(passage_snapshot.where((element) => element.id==e).toList()[0].data()as Map)).toList(),
     ) ;
  }
}
class STATEMENT_Question {
  late String title;
  late String image;
  late String solution;
  late int answer;
  late List<String> solution_images;
  STATEMENT_Question(
      {required this.image,required this.solution_images ,required this.title, required this.solution, required this.answer});

  factory STATEMENT_Question.fromMap(Map<String, dynamic> map){
    return STATEMENT_Question(
        title: map['title'] ?? "",
        image: map['question_image'] ?? "",
        solution: map['solution'] ?? "",
        answer: map['answer'] ?? -1,
      solution_images:List.castFrom(map['solution_image']??[]),
    );
  }
}
class IT_Question{
  late String title;
  late String image;
  late String solution;
  late List<String> solution_images;
  late int answer;

  IT_Question({required this.image,required this.solution_images,required this.title,required this.solution,required this.answer});
 factory IT_Question.fromMap(Map<String,dynamic> map){
    return IT_Question(
        title :map['title']??"",
        image: map['image']??"",
        solution_images:List.castFrom(map['solution_image']??[]),
        solution: map['solution']??"",
        answer: map['answer']??-1
     ) ;
  }
}
