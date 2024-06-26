


import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../presentation/widgets/app_snack_bar.dart';


class AuthController{

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //signing with email
  static Future<bool> signInWithEmailAndPassword({required String email, required String pass, required BuildContext context}) async {
    try {

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      User? user = userCredential.user;

      Navigator.pushNamed(context, "/admin-dashboard");

      AppSnackBar.appSnackBar(text: "Login Success", bg: Colors.green, context: context);

      return true;
    } on FirebaseAuthException catch (e) {
      print('Error during email/password sign in: $e');
      return false;

      // Handle different Firebase Auth exceptions (e.g., invalid email, wrong password)
    }
  }




  //signup
  static Future<bool> signUp({required BuildContext context, required String email, required String pass,required String fullName,  required String gender}) async {
    try {
      Random rnd = new Random();
      int id = rnd.nextInt(10);

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: pass.trim(),
      );

      User? user = userCredential.user;
      // Update user profile in Firestore without a profile image
      await _firestore.collection('users').doc(user?.uid).set({
        "id": id.toString(),
        'full_name': fullName.trim(),
        'email': user!.email,
        "profile" : null,
        "gender" : gender,
        "status" : "1"
        // Add other profile information as needed
      });

      return true;
    } on FirebaseAuthException catch (e) {
      print('Error during signup: $e');
      if(e.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("The email address is already in use by another account."),
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 3000),
        ));
      }
      return false;
      // Handle different Firebase Auth exceptions
    }
  }

  //logout
  static Future<void> signOut(context) async {
    try {

      await FirebaseAuth.instance.signOut();


    } catch (e) {
      print("Error signing out: $e");
    }
  }

  static Future<void> deleteAccount(context) async {
    try {


      // Get the currently signed-in user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Delete the user account
        await user.delete();

        print("User account deleted successfully");
      } else {
        print("No user signed in");
      }
    } catch (e) {
      print("Error deleting user account: $e");
    }
  }


  static   Future<void> resetPassword({required String email, required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      // Password reset email sent successfully
      AppSnackBar.appSnackBar(text: "Password reset email sent successfully. Check Your mail.", bg: Colors.green, context: context);
      print("Password reset email sent successfully");
      // You can navigate to a success screen or show a success message here
    } catch (e) {
      // An error occurred while sending the password reset email
      print("Error sending password reset email: $e");
      // You can display an error message to the user
    }
  }

}