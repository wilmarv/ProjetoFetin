import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projetofetin/componentes/button.dart';
import 'package:projetofetin/componentes/loading.dart';
import 'package:projetofetin/constants/fontSize.dart';
import 'package:projetofetin/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ViewWorkDesk extends StatefulWidget {
  const ViewWorkDesk({Key? key}) : super(key: key);

  @override
  _ViewWorkDeskState createState() => _ViewWorkDeskState();
}

class _ViewWorkDeskState extends State<ViewWorkDesk> {
  final _fireStore = FirebaseFirestore.instance;

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
                Lista(_fireStore),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  button("Abrir", 140, 50, () {}),
                  button("Proximo", 150, 50, () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget Lista(firestore) {
  return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    stream: firestore.collection("fila").snapshots(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
        case ConnectionState.none:
          return Center(child: CircularProgressIndicator());
        default:
          QuerySnapshot<Map<String, dynamic>>? doc = snapshot.data;
          int tamanhoFila = doc?.size != null ? (doc!.size - 1) : 0;
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount:tamanhoFila,
              itemBuilder: (context, index) {
                int senha = doc?.docs[index].get("senha");
                String nome = doc?.docs[index].get("nome");
                String matricula = doc?.docs[index].get("matricula");
                return Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${senha}",
                                style:
                                    TextStyle(fontSize: fontSize().titulo16)),
                            Text(nome,
                                style:
                                    TextStyle(fontSize: fontSize().titulo16)),
                            Text(matricula,
                                style:
                                    TextStyle(fontSize: fontSize().titulo16)),
                          ],
                        )));
              });
      }
    },
  );
}
