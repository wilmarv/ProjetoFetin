import "package:flutter/material.dart";
import 'package:projetofetin/constants/fontSize.dart';

Widget button(String name,double width,double height) {
  return ElevatedButton(
      child: Text(
        name,
        style: TextStyle(
            fontSize: fontSize().titulo16, fontStyle: FontStyle.italic),
      ),
      style: ElevatedButton.styleFrom(fixedSize: Size(width, height),
      ),
      onPressed: (){});
}
