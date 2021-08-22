import 'package:flutter/material.dart';
import 'package:projetofetin/componentes/loading.dart';
import 'package:projetofetin/constants/fontSize.dart';
import 'package:projetofetin/componentes/textField.dart';
import 'package:projetofetin/componentes/button.dart';
import 'package:projetofetin/model/user_model.dart';
import 'package:projetofetin/view/register.dart';
import 'package:scoped_model/scoped_model.dart';


Widget ViewLogin(BuildContext context) {
  return ScopedModelDescendant<UsuarioModel>(
      builder: (context, child, model) {
    if (model.isLoading) return containerLoading();
    return SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.blueGrey])),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 150,
            child: Image.asset(
              "images/Logo40Fetin.png",
            ),
          ),
          //textField("email", false, TextInputType.emailAddress),
          Divider(color: Colors.transparent, height: 0),
          //textField("Senha", true, TextInputType.text),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              "Esqueci a senha! ",
              style: TextStyle(
                  fontSize: fontSize().texto,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
          // button("Entrar", 300, 50),
          Divider(color: Colors.transparent),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                child: Column(
                  children: [
                    Text(
                      "Ainda não possuim uma conta?",
                      style: TextStyle(
                          fontSize: fontSize().texto,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "Cadastra-se!",
                      style: TextStyle(
                          fontSize: fontSize().texto,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewRegister()));
                },
              ),
            ],
          )
        ],
      ),
    ));
  });
}
