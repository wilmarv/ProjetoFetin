import 'package:flutter/material.dart';
import 'package:projetofetin/componentes/TextField.dart';
import 'package:projetofetin/constants/fontSize.dart';
import 'package:projetofetin/componentes/button.dart';

class ViewSelectDesk extends StatelessWidget {
  const ViewSelectDesk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double weightMobile = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Senha Digital",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontSize: fontSize().titulo26),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app_outlined))
        ],
      ),
      body: Container(
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
                        textField("Guiche", false, TextInputType.number),
                        Divider(color: Colors.transparent),
                        button("Gerar Senha", weightMobile * 0.65, 50)
                      ],
                    ),
                  ),
                  Divider(color: Colors.transparent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
