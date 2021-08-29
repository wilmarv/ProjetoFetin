import "package:flutter/material.dart";
import 'package:projetofetin/constants/fontSize.dart';

Widget textField(String label,bool passworld,TextInputType keyboardType,
    TextEditingController controller, TextInputAction textInputAction){
  RegExp regexNome = new RegExp(r"[A-Za-z]+( [A-Za-z]*)*");
  RegExp regexEmail = new RegExp(r"([\w\.\-]+)@([\w\-]+)((\.(\w)+))?((\.(\w){2,3}))*");

  return TextFormField(
    controller: controller,
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
    keyboardType:keyboardType,
    validator: (value){
      if(value == null || value.isEmpty)return "Campo "+label+" é obrigatorio!";
      if(keyboardType == TextInputType.name){
        if (!regexNome.hasMatch(value))return 'Formato de nome incorreto';
        return null;
      }
      if(keyboardType == TextInputType.emailAddress){
        if (!regexEmail.hasMatch(value))return 'Email incorreto';
        return null;
      }
      if(keyboardType == TextInputType.visiblePassword){
        if(value.length<6)return "Senha fraca. Acrescente mais Caracteres!";
        return null;
      }
    },
    textInputAction:textInputAction ,
  );
}