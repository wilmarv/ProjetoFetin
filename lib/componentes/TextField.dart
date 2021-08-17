import "package:flutter/material.dart";
import 'package:projetofetin/constants/fontSize.dart';

Widget textField(String label,bool passworld,TextInputType keyboardType){
  return TextField(
    decoration: InputDecoration(
        labelText:label,
        labelStyle: TextStyle(fontSize: fontSize().titulo16,color: Colors.black),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black)),
    ),
    style: TextStyle(fontSize: fontSize().titulo16),
    autofocus: true,
    obscureText: passworld,
    cursorColor: Colors.black,
    cursorHeight: 28,
    keyboardType:keyboardType ,
  );
}