import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projetofetin/componentes/loading.dart';
import 'package:projetofetin/constants/fontSize.dart';
import 'package:projetofetin/componentes/button.dart';
import 'package:projetofetin/model/user_model.dart';
import 'package:projetofetin/view/panel.dart';
import 'package:scoped_model/scoped_model.dart';

Widget ViewQueue(BuildContext context, FirebaseFirestore fireStore) {
  final widthMobile = MediaQuery.of(context).size.width;

  return Container(
    height: MediaQuery.of(context).size.height * 0.9,
    width: widthMobile,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blueGrey])),
    padding: EdgeInsets.only(top: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          color: Colors.white38,
          margin: EdgeInsets.all(10),
          elevation: 3,
          shadowColor: Colors.blueGrey,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  width: widthMobile * 0.9,
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: fireStore.collection("fila").snapshots(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return containerLoading();
                          default:
                            QuerySnapshot<Map<String, dynamic>>? doc =
                                snapshot.data;
                            int tamanhoDocumento =
                                doc?.size != null ? (doc!.size - 1) : 0;
                            String tamanhoFila = doc?.size != null
                                ? (doc!.size - 1).toString()
                                : " ";
                            return StreamBuilder<
                                QuerySnapshot<Map<String, dynamic>>>(
                              stream:
                                  fireStore.collection("aberto").snapshots(),
                              builder: (context, snapshotGuiche) {
                                switch (snapshotGuiche.connectionState) {
                                  case ConnectionState.waiting:
                                  case ConnectionState.none:
                                    return containerLoading();
                                  default:
                                    QuerySnapshot<Map<String, dynamic>>? aberto =
                                        snapshotGuiche.data;
                                    bool guicheDisponivel =
                                    aberto?.size != 0 ? true : false;
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Pessoas na fila:",
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: fontSize().titulo36,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        Divider(color: Colors.transparent),
                                        Text(tamanhoFila.padLeft(2,"0"),
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: fontSize().titulo36,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic)),
                                        Divider(color: Colors.transparent),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Guiche Disponivel! ",
                                                style: TextStyle(
                                                    fontSize:
                                                        fontSize().texto)),
                                            Icon(
                                              Icons.circle,
                                              color: guicheDisponivel
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          ],
                                        ),
                                        Divider(color: Colors.transparent),
                                        button("Gerar Senha",
                                            widthMobile * 0.65, 50, () {
                                          int proximaSenha = doc
                                              ?.docs[tamanhoDocumento]
                                              .get("proximaSenha");
                                          print(guicheDisponivel);
                                          if (guicheDisponivel) {
                                            Map<String, dynamic> data = {
                                              "nome":
                                                  ScopedModel.of<UsuarioModel>(
                                                          context)
                                                      .userData["nome"],
                                              "matricula":
                                                  ScopedModel.of<UsuarioModel>(
                                                          context)
                                                      .userData["matricula"],
                                              "senha": proximaSenha
                                            };
                                            ScopedModel.of<UsuarioModel>(
                                                    context)
                                                .isLoading = true;
                                            fireStore
                                                .collection("fila")
                                                .doc(proximaSenha.toString())
                                                .set(data)
                                                .then((value) {
                                              fireStore
                                                  .collection("fila")
                                                  .doc("placar")
                                                  .update({
                                                "proximaSenha": proximaSenha + 1
                                              });
                                              ScopedModel.of<UsuarioModel>(
                                                      context)
                                                  .isLoading = false;
                                              ScopedModel.of<UsuarioModel>(
                                                      context)
                                                  .senha = proximaSenha;
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewPanel()));
                                            });
                                          } else
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Não há mais guinche atendendo tente mais tarde!"),
                                              backgroundColor: Colors.red,
                                              duration: Duration(seconds: 4),
                                            ));
                                        })
                                      ],
                                    );
                                }
                              },
                            );
                        }
                      })),
            ],
          ),
        ),
      ],
    ),
  );
}
