import 'package:check1/models/user_model.dart';
import 'package:check1/screens/auth/register_details.dart';
import 'package:check1/screens/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {

  void handle_signin(context)async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String uid = _auth.currentUser!.uid;
    DocumentSnapshot documentSnapshot = await _firestore.collection('user_data').doc(uid).get();

    if(documentSnapshot.exists){
       String name_field = documentSnapshot.get('name');
       if(name_field!=null&&name_field!=''){
         //second time user
         Navigator.push(context, MaterialPageRoute(builder: (_)=>DashboardPage()));
         return ;
       }
    }
      //first time user
      Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterDetails()));

  }
  void update_user(UserModel user)async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String uid = _auth.currentUser!.uid;
    await _firestore.collection('user_data').doc(uid).update({
          "name":user.name,
          "phone":user.phone,
          "email":user.email,
          "class_of_study":user.class_of_study,
          "school":user.school
        });
  }
  Future<UserModel> fetch_current_user()async{
    UserModel user;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String uid = _auth.currentUser!.uid;
    DocumentSnapshot documentSnapshot = await _firestore.collection('user_data').doc(uid).get();
    var data = documentSnapshot.data() as Map;
    user = UserModel(
      name: data['name']??"",
      email:data['email']??"",
      phone: data['phone']??"",
      class_of_study: data['class_of_study']??"",
      school: data['school']??""
    );

    return user;
  }


}