import 'package:flutter/material.dart';
import 'package:projetofetin/constants/fontSize.dart';
import 'package:projetofetin/componentes/TextField.dart';
import 'package:projetofetin/componentes/button.dart';

class ViewRegister extends StatelessWidget {
  const ViewRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Senha Digital",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontSize: fontSize().titulo26),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.blueGrey])),
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              child: Image.asset(
                "images/Logo40Fetin.png",
              ),
            ),
            textField("Nome", false, TextInputType.name),
            Divider(color: Colors.transparent, height: 10),
            textField("email", false, TextInputType.emailAddress),
            Divider(color: Colors.transparent, height: 10),
            textField("Senha", true, TextInputType.text),
            Divider(color: Colors.transparent, height: 10),
            textField("Matricula", false, TextInputType.number),
            Divider(color: Colors.transparent, height: 10),
            button("Registre-se", 300, 50),
            Divider(color: Colors.transparent),
          ],
        ),
      )),
    );
  }
}
