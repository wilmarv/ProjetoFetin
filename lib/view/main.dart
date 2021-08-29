import 'package:flutter/material.dart';
import 'package:projetofetin/constants/fontSize.dart';
import 'package:projetofetin/model/user_model.dart';
import 'package:projetofetin/view/login.dart';
import 'package:projetofetin/view/queue.dart';
import 'package:projetofetin/view/selectDesk.dart';
import 'package:scoped_model/scoped_model.dart';

class ViewMain extends StatefulWidget {
  const ViewMain({Key? key}) : super(key: key);

  @override
  _ViewMainState createState() => _ViewMainState();
}

class _ViewMainState extends State<ViewMain> {
  final _guicheController = TextEditingController();
  final _formGuicheKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Senha Digital",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontSize: fontSize().titulo26),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app_outlined),
              onPressed: () {
                ScopedModel.of<UsuarioModel>(context).singOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ViewLogin()));
              })
        ],
      ),
      body: ScopedModel.of<UsuarioModel>(context).userData["adm"]
          ? ViewSelectDesk(context, _guicheController, _formGuicheKey)
          : ViewQueue(),
    );
  }
}
