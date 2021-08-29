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


  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _loadCurrentUser();
  }

  bool isConected() {
    return firebaseUser != null;
  }

  void singUp(Map<String, dynamic> userData, String password,
      VoidCallback onSucces, VoidCallback onFail) async {
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
      await _loadCurrentUser();
    }).catchError((erro) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void singIn(String email, String password, VoidCallback onSucces,
      VoidCallback onFail) async {
    this.isLoading = true;
    notifyListeners();
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) async{
      firebaseUser = user.user;
      await _loadCurrentUser();
      onSucces();
      this.isLoading = false;
      notifyListeners();
    }).catchError((error) {
      print("Error: ");
      print(error);
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void singOut()async{
    await _auth.signOut();
    userData = Map();
    firebaseUser = null;
    notifyListeners();
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    firestore.collection("usuarios").doc(userData["email"]).set(userData);
  }

  Future<Null> _loadCurrentUser() async {
    if (firebaseUser == null) firebaseUser = await _auth.currentUser;
    if (firebaseUser != null) {
      if (userData["nome"] == null) {
        DocumentSnapshot docUser = await FirebaseFirestore.instance.collection("usuarios").
        doc(firebaseUser!.email).get();
        userData["nome"] = docUser.get("nome");
        userData["email"] = docUser.get("email");
        userData["matricula"] = docUser.get("matricula");
        userData["adm"] = docUser.get("adm");
      }
    }
    notifyListeners();
  }

  void passowordChange() {}
}
