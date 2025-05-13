import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isLoading = false;

  //hiden password
  var hidenPassword = true;

  //hiden Confirm password
  var hidenCofirmPassword = true;

  //toggle show Pasword
  void showPassword() {
    hidenPassword = !hidenPassword;
    update();
  }

  //toggle show Pasword
  void showConfirmPassword() {
    hidenCofirmPassword = !hidenCofirmPassword;
    update();
  }

  Future<void> register(String? name, String? email, String? password,
      String? confirmPassword, BuildContext context) async {
    if ((name?.trim().isEmpty ?? true) ||
        (email?.trim().isEmpty ?? true) ||
        (password?.trim().isEmpty ?? true) ||
        (confirmPassword?.trim().isEmpty ?? true)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("All fields are required"),
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }

    try {
      isLoading = true;
      update();

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      User? user = userCredential.user;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User registration failed"),
          ),
        );
        return;
      }

      String uid = user.uid;

      await _firestore.collection("users").doc(uid).set({
        'uid': uid,
        'name': name,
        'email': email,
        'cre' : DateTime.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Registration completed"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Something went wrong')));
    } finally {
      isLoading = false;
      update();
    }
    update();
  }
}
