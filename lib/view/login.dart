import 'package:flutter/material.dart';
import 'package:projetofetin/componentes/button.dart';
import 'package:projetofetin/componentes/loading.dart';
import 'package:projetofetin/constants/fontSize.dart';
import 'package:projetofetin/componentes/textField.dart';
import 'package:projetofetin/model/user_model.dart';
import 'package:projetofetin/view/main.dart';
import 'package:projetofetin/view/register.dart';
import 'package:scoped_model/scoped_model.dart';

class ViewLogin extends StatefulWidget {
  const ViewLogin({Key? key}) : super(key: key);

  @override
  _ViewLoginState createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  final _emailLoginController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formLoginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
      body: ScopedModel.of<UsuarioModel>(context).isLoading
          ? containerLoading()
          : SingleChildScrollView(
              child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.blueGrey])),
              padding: EdgeInsets.all(15),
              child: Form(
                key: _formLoginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 150,
                      child: Image.asset(
                        "images/Logo40Fetin.png",
                      ),
                    ),
                    Column(
                      children: [
                        textField("email", false, TextInputType.emailAddress,
                            _emailLoginController, TextInputAction.next),
                        Divider(color: Colors.transparent, height: 20),
                        textField("Senha", true, TextInputType.visiblePassword,
                            _senhaController, TextInputAction.done),
                        Divider(color: Colors.transparent, height: 20),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Esqueci a senha! ",
                            style: TextStyle(
                                fontSize: fontSize().texto,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        Divider(color: Colors.transparent, height: 20),
                        button("Entrar", 300, 50, () {
                          if (_formLoginKey.currentState!.validate()) {
                            ScopedModel.of<UsuarioModel>(context).singIn(
                                _emailLoginController.text,
                                _senhaController.text,
                                _onSuccess,
                                _onFail);
                          }
                        }),
                        Divider(color: Colors.transparent, height: 20),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          child: Column(
                            children: [
                              Text(
                                "Ainda não possuim uma conta?",
                                style: TextStyle(
                                    fontSize: fontSize().texto,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                "Cadastra-se!",
                                style: TextStyle(
                                    fontSize: fontSize().texto,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewRegister()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
    );
  }

  void _onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Login efetuado com sucesso!"),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 4),
    ));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => ViewMain()));
  }

  void _onFail() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Falha na tentativa de conectar!"),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 4),
    ));
  }
}
