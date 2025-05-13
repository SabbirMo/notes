import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class LoginController extends GetxController{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  var hidenPassword = true;

  bool isLoading = false;

  void showPassword(){
    hidenPassword = !hidenPassword;
    update();
  }

  Future<void> login(String? email, String? password, BuildContext context) async {
    if((email?.trim().isEmpty ?? true) || (password?.trim().isEmpty ?? true)){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All field is required")));
    }
    try {
      isLoading = true;
      await _auth.signInWithEmailAndPassword(email: email!, password: password!);
      context.go('/home_page');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong")));
    }finally{
      isLoading = false;
    }
  }
}