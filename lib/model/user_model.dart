import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UsuarioModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? firebaseUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;
  bool adm = false;
  int? guiche;
  int? senha;

  bool isConected() {
    return firebaseUser != null;
  }

  void singUp(Map<String, dynamic> userData, String password,
      VoidCallback onSucces, VoidCallback onFail) {
    this.isLoading = true;
    notifyListeners();
    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: password)
        .then((user) async {
      firebaseUser = user.user;
      await _saveUserData(userData);
      onSucces();
      this.isLoading = false;
      notifyListeners();
    }).catchError((erro) {
      print(erro);
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void singIn() {
    this.isLoading = true;
    notifyListeners();
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    firestore.collection("usuarios").doc(userData["email"]).set(userData);
  }

  void passowordChange() {}
}
