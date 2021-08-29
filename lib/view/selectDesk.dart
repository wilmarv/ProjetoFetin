import 'package:flutter/material.dart';
import 'package:projetofetin/componentes/textField.dart';
import 'package:projetofetin/constants/fontSize.dart';
import 'package:projetofetin/componentes/button.dart';
import 'package:projetofetin/view/workDesk.dart';

Widget ViewSelectDesk(context,_guicheController,_formGuicheKey) {
  double weightMobile = MediaQuery.of(context).size.width;
  return Container(
    height: MediaQuery.of(context).size.height * 0.9,
    width: weightMobile,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blueGrey])),
    padding: EdgeInsets.only(top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          color: Colors.white38,
          margin: EdgeInsets.all(20),
          elevation: 3,
          shadowColor: Colors.blueGrey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                width: weightMobile * 0.7,
                child: Form(
                  key: _formGuicheKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Selecione o Guiche:",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: fontSize().titulo36,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      Divider(color: Colors.transparent),
                      textField("Guiche", false, TextInputType.number,
                          _guicheController, TextInputAction.next),
                      Divider(color: Colors.transparent),
                      button("Gerar Senha", weightMobile * 0.65, 50, () {
                        if (_formGuicheKey.currentState!.validate()) {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewWorkDesk()));
                        }
                      })
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.transparent),
            ],
          ),
        ),
      ],
    ),
  );
}
