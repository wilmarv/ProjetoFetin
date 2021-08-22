import 'package:flutter/material.dart';
import 'package:projetofetin/componentes/loading.dart';
import 'package:projetofetin/constants/fontSize.dart';
import 'package:projetofetin/model/user_model.dart';
import 'package:projetofetin/view/login.dart';
import 'package:projetofetin/view/register.dart';
import 'package:scoped_model/scoped_model.dart';

class ViewMain extends StatefulWidget {
  const ViewMain({Key? key}) : super(key: key);

  @override
  _ViewMainState createState() => _ViewMainState();
}

class _ViewMainState extends State<ViewMain> {
  @override
  Widget build(BuildContext context){
    return ScopedModelDescendant<UsuarioModel>(
        builder: (context, child, model) {
      Widget viewBody;
      if(model.isConected()) viewBody = Container();
      else viewBody = ViewLogin(context);
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Senha Digital",
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontSize: fontSize().titulo26),
              ),
              Image.asset(
                "images/Logo40Fetin.png",
                scale: 6,
              )
            ],
          ),
        ),
        body: model.isLoading?containerLoading():viewBody,
      );
    });
  }
}
