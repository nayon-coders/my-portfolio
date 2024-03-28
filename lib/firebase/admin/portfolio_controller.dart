import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../presentation/widgets/app_snack_bar.dart';

class PortfolioController{

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<bool> addPortolfio({required Map<String, dynamic> data, })async{

    try{
      User? user = _auth.currentUser;
      await _firestore.collection('portfolio').add(data);
      return true;
    }catch(e){
      print("Error adding portfolio: $e");
      return false;
    }

  }

  static Future<bool> editPortfolio({required Map<String, dynamic> data, required String id })async{

    try{
      User? user = _auth.currentUser;
      await _firestore.collection('portfolio').doc(id).update(data);
      return true;
    }catch(e){
      print("Error adding portfolio: $e");
      return false;
    }

  }

  //get messages


//add messages
  static Future addMessages(context, data)async{
    try{
      await _firestore.collection("messages").add(data).then((value) {
        AppSnackBar.appSnackBar(text: "Your messages is submitted. As soon as we will reply you. Thanks.", bg: Colors.green, context: context);
      });
    }catch(e){
      print("print---- $e");
    }
  }


}