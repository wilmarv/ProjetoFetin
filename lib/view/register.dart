import 'package:flutter/material.dart';
import 'package:projetofetin/componentes/loading.dart';
import 'package:projetofetin/constants/fontSize.dart';
import 'package:projetofetin/componentes/textField.dart';
import 'package:projetofetin/componentes/button.dart';
import 'package:projetofetin/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ViewRegister extends StatefulWidget {
  const ViewRegister({Key? key}) : super(key: key);

  @override
  _ViewRegisterState createState() => _ViewRegisterState();
}

class _ViewRegisterState extends State<ViewRegister> {
  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();
  final _emailController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffold,
        appBar: AppBar(
          title: Text(
            "Senha Digital",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontSize: fontSize().titulo26),
          ),
        ),
        body: ScopedModelDescendant<UsuarioModel>(
          builder: (context, child, model) {
            if (model.isLoading) return containerLoading();
            return SingleChildScrollView(
                child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.blueGrey])),
              padding: EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      child: Image.asset(
                        "images/Logo40Fetin.png",
                      ),
                    ),
                    textField(
                        "Nome", false, TextInputType.name, _nomeController),
                    Divider(color: Colors.transparent, height: 10),
                    textField("email", false, TextInputType.emailAddress,
                        _emailController),
                    Divider(color: Colors.transparent, height: 10),
                    textField("Senha", true, TextInputType.visiblePassword,
                        _senhaController),
                    Divider(color: Colors.transparent, height: 10),
                    textField("Matricula", false, TextInputType.number,
                        _matriculaController),
                    Divider(color: Colors.transparent, height: 10),
                    button("Registre-se", 300, 50, () {
                      if (_formKey.currentState!.validate()) {
                        Map<String, dynamic> userData = {
                          "nome": _nomeController.text,
                          "email": _emailController.text,
                          "matricula": _matriculaController.text,
                          "adm": false,
                        };
                        model.singUp(userData, _senhaController.text,
                            _onSuccess, _onFail);
                      }
                    }),
                    Divider(color: Colors.transparent),
                  ],
                ),
              ),
            ));
          },
        ));
  }

  void _onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso!"),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 4),
    ));
    Future.delayed(Duration(seconds: 5)).then((value)=> Navigator.of(context).pop() );
  }
  void _onFail() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Falha ao criar usuário!"),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 4),
    ));
  }
}
