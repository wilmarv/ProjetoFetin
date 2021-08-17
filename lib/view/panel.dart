import 'package:flutter/material.dart';
import 'package:projetofetin/constants/fontSize.dart';

class ViewPanel extends StatefulWidget {
  const ViewPanel({Key? key}) : super(key: key);

  @override
  _ViewPanelState createState() => _ViewPanelState();
}

class _ViewPanelState extends State<ViewPanel> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              color: Colors.white38,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              elevation: 3,
              shadowColor: Colors.blueGrey,
              child: Column(
                children: [
                  Divider(color: Colors.transparent),
                  Text(
                    "000",
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
                    "00",
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
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              elevation: 3,
              shadowColor: Colors.blueGrey,
              child: Column(
                children: [
                  Divider(color: Colors.transparent),
                  Text(
                    "000",
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
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                      color: Colors.white38,
                      elevation: 3,
                      shadowColor: Colors.blueGrey,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Column(
                          children: [
                            Text(
                              "000",
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
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            Text(
                              "000",
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
        ),
      ),
    );
  }
}
