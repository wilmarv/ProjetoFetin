import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetofetin/model/user_model.dart';
import 'package:projetofetin/view/main.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ScopedModel<UsuarioModel>(
    model: UsuarioModel(),
    child: MaterialApp(
      home: ViewMain(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
