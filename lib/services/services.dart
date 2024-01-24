import 'package:app/app/constant.dart';
import 'package:app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Services {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> register(UserModel userModel, BuildContext context) async {
    try {
      bool result = false;
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userModel.email!, password: userModel.password!);

      final User? user = userCredential.user;
      if (user != null) {
        await _firebaseFirestore
            .collection('user')
            .doc(_auth.currentUser!.uid)
            .set(userModel.toJson())
            .then((value) {
          result = true;
        });
        return result;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return false;
  }

  Future<bool> signIn(
      String email, String password, BuildContext context) async {
    bool result = false;
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      result = true;
      await _firebaseFirestore
          .collection("user")
          .doc(_auth.currentUser!.uid)
          .get()
          .then((value) {
        Constant.userModel = UserModel.fromJson(value.data()!);
      }).whenComplete(() {
        result = true;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
    if (result) {
      return result;
    }
    return false;
  }

  Future<bool> logOut() async {
    try {
      await _auth.signOut().catchError((e) {
        debugPrint(e.toString());
      });
      return true;
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<bool> forgetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email).catchError((e) {
        debugPrint(e.toString());
      });
      return true;
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<void> getUserData() async {
    try {
      await _firebaseFirestore
          .collection('user')
          .doc(_auth.currentUser!.uid)
          .get()
          .then((value) {
        Constant.userModel=UserModel.fromJson(value.data()!);
      }).catchError((e) {
        debugPrint(e.toString());
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
