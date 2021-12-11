
import 'package:check1/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  void add_user(UserModel user)async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', user.name!);
      await prefs.setString('phone', user.phone!);
      await prefs.setString('email', user.email!);
      await prefs.setString('class_of_study', user.class_of_study!);
      await prefs.setString('school', user.school!);
    }catch(e){
      print("Error while adding user data check preferences");
    }
  }
  Future<UserModel> fetch_user_local()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = (await prefs.getString("name"))??'';
    String email = (await prefs.getString("email"))??'';
    String phone = (await prefs.getString("phone"))??'';
    String class_of_study = (await prefs.getString("class_of_study"))??'';
    String school = (await prefs.getString("school"))??'';
    return UserModel(name: name,email: email,phone: phone,class_of_study: class_of_study,school: school);
  }
}

