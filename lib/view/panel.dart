import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projetofetin/componentes/loading.dart';
import 'package:projetofetin/constants/fontSize.dart';
import 'package:projetofetin/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ViewPanel extends StatefulWidget {
  const ViewPanel({Key? key}) : super(key: key);

  @override
  _ViewPanelState createState() => _ViewPanelState();
}

class _ViewPanelState extends State<ViewPanel> {
  final _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    double weightMobile = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _sairFila,
      child: Scaffold(
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
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: _fireStore.collection("fila").doc("placar").snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return containerLoading();
                  default:
                    String senhaAtual = snapshot.data?.get("senhaAtual");
                    String guicheAtual = snapshot.data?.get("guicheAtual");
                    String senhaUsuario =
                        ScopedModel.of<UsuarioModel>(context).senha.toString();
                    String senhaAnterior = snapshot.data?.get("senhaAnterior");
                    String guicheAnterior =
                        snapshot.data?.get("guicheAnterior");
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(
                          color: Colors.white38,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          elevation: 3,
                          shadowColor: Colors.blueGrey,
                          child: Column(
                            children: [
                              Divider(color: Colors.transparent),
                              Text(
                                senhaAtual.padLeft(3,"0"),
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: fontSize().titulo36,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                "Senha Atual",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: fontSize().titulo36,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              Divider(color: Colors.transparent),
                              Text(
                                guicheAtual.padLeft(2,"0"),
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: fontSize().titulo36,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              Divider(color: Colors.transparent),
                              Text(
                                "Guiche",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: fontSize().titulo36,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              Divider(color: Colors.transparent),
                            ],
                          ),
                        ),
                        Card(
                          color: Colors.white38,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          elevation: 3,
                          shadowColor: Colors.blueGrey,
                          child: Column(
                            children: [
                              Divider(color: Colors.transparent),
                              Text(
                                senhaUsuario.padLeft(3,"0"),
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: fontSize().titulo36,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                "Sua Senha",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: fontSize().titulo36,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              Divider(color: Colors.transparent),
                            ],
                          ),
                        ),
                        Container(
                          width: weightMobile,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                  color: Colors.white38,
                                  elevation: 3,
                                  shadowColor: Colors.blueGrey,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: Column(
                                      children: [
                                        Text(
                                          senhaAnterior.padLeft(3,"0"),
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: fontSize().titulo32,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          "Senha Anterior",
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: fontSize().titulo32,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ],
                                    ),
                                  )),
                              Card(
                                  color: Colors.white38,
                                  elevation: 3,
                                  shadowColor: Colors.blueGrey,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Column(
                                      children: [
                                        Text(
                                          guicheAnterior.padLeft(2,"0"),
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: fontSize().titulo32,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        Text(
                                          "Guiche",
                                          style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: fontSize().titulo32,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        Divider(color: Colors.transparent),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    );
                }
              },
            )),
      ),
    );
  }

  Future<bool> _sairFila() async {
    bool shouldPop = true;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Sair da Fila?"),
            content: Text("Se sair agora terá que voltar para o fim da fila!"),
            actions: [
              FlatButton(
                  onPressed: () {
                    setState(() {
                      shouldPop = true;
                    });
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    _fireStore
                        .collection("fila")
                        .doc(ScopedModel.of<UsuarioModel>(context)
                            .senha
                            .toString())
                        .delete()
                        .then((value) {
                      setState(() {
                        shouldPop = true;
                      });
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Sair!"))
            ],
          );
        });
    return shouldPop;
  }
}
