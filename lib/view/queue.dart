import 'package:flutter/material.dart';
import 'package:projetofetin/constants/fontSize.dart';
import 'package:projetofetin/componentes/button.dart';
import 'package:projetofetin/view/panel.dart';
import 'package:projetofetin/view/register.dart';

class ViewQueue extends StatefulWidget {
  const ViewQueue({Key? key}) : super(key: key);

  @override
  _ViewQueueState createState() => _ViewQueueState();
}

class _ViewQueueState extends State<ViewQueue> {
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
                    width: weightMobile * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        Text("000",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: fontSize().titulo36,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic)),
                        Text("Tempo de espera médio: XX mins",
                            style: TextStyle(fontSize: fontSize().texto)),
                        Divider(color: Colors.transparent),
                        button("Gerar Senha", weightMobile * 0.65, 50,(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewPanel()));
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
