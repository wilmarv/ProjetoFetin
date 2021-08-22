import 'package:flutter/material.dart';
import 'package:projetofetin/componentes/button.dart';
import 'package:projetofetin/constants/fontSize.dart';

class ViewWorkDesk extends StatefulWidget {
  const ViewWorkDesk({Key? key}) : super(key: key);

  @override
  _ViewWorkDeskState createState() => _ViewWorkDeskState();
}

class _ViewWorkDeskState extends State<ViewWorkDesk> {
  @override
  Widget build(BuildContext context) {
    double weightMobile = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:Text(
          "Senha Digital",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontSize: fontSize().titulo26),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: weightMobile,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.blueGrey])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: weightMobile,
                  child: Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Senha",
                                style:
                                    TextStyle(fontSize: fontSize().titulo16)),
                            Text("Nome",
                                style:
                                    TextStyle(fontSize: fontSize().titulo16)),
                            Text("Matricula",
                                style:
                                    TextStyle(fontSize: fontSize().titulo16)),
                          ],
                        )),
                  ),
                ),
                Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("001",
                                style:
                                    TextStyle(fontSize: fontSize().titulo16)),
                            Text("Wilmar Vitor Fonseca",
                                style:
                                    TextStyle(fontSize: fontSize().titulo16)),
                            Text("1332",
                                style:
                                    TextStyle(fontSize: fontSize().titulo16)),
                          ],
                        ))),
                Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("002",
                                style:
                                TextStyle(fontSize: fontSize().titulo16)),
                            Text("Daniel Coelho",
                                style:
                                TextStyle(fontSize: fontSize().titulo16)),
                            Text("1346",
                                style:
                                TextStyle(fontSize: fontSize().titulo16)),
                          ],
                        ))),
                Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("003",
                                style:
                                TextStyle(fontSize: fontSize().titulo16)),
                            Text("Francisco",
                                style:
                                TextStyle(fontSize: fontSize().titulo16)),
                            Text("1352",
                                style:
                                TextStyle(fontSize: fontSize().titulo16)),
                          ],
                        )))
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //button("Abrir", 140, 50),
                  //button("Proximo", 150, 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
