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
                listarFila(_fireStore),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: ScopedModelDescendant<UsuarioModel>(
                builder: (context,child,model){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      button(model.guicheIsOpen?"fechar":"Abrir", 140, 50, () {
                        print(model.guicheIsOpen);
                        if (model.guicheIsOpen)
                          model.fecharGuiche();
                        else
                          model.abrirGuiche();
                      }),
                      button("Proximo", 150, 50, () {
                        String? proximoFila =
                            model.proximoFila;
                        if (proximoFila != "")
                          _fireStore
                              .collection("fila")
                              .doc(proximoFila)
                              .delete()
                              .then((value) {
                            _fireStore.collection("fila").doc("placar").update({
                              "senhaAtual": proximoFila,
                              "guicheAtual":
                              model.guiche,
                              "senhaAnterior": model.painel?["senhaAtual"],
                              "guicheAnterior":
                              model
                                  .painel?["guicheAtual"],
                            });
                          });
                      }),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget listarFila(firestore) {
  final _fireStore = FirebaseFirestore.instance;
  return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    stream: _fireStore.collection("fila").orderBy("senha").snapshots(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
        case ConnectionState.none:
          return containerLoading();
        default:
          QuerySnapshot<Map<String, dynamic>>? doc = snapshot.data;
          int tamanhoFila = doc?.size != null ? (doc!.size - 1) : 0;
          ScopedModel.of<UsuarioModel>(context).tamanhoFila = tamanhoFila;
          Map<String, dynamic>? painel = doc?.docs[0].data();
          ScopedModel.of<UsuarioModel>(context).painel = painel;
          if (tamanhoFila >= 1)
            ScopedModel.of<UsuarioModel>(context).proximoFila =
                doc?.docs[1].get("senha").toString();
          else
            ScopedModel.of<UsuarioModel>(context).proximoFila = "";
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: tamanhoFila,
              itemBuilder: (context, index) {
                String? senha = doc?.docs[index + 1].get("senha").toString();
                String nome = doc?.docs[index + 1].get("nome");
                String matricula = doc?.docs[index + 1].get("matricula");
                return Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(senha!.padLeft(3,"0"),
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
