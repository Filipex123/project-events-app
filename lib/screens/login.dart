import 'package:brota_ai_app/components/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF198754),
        body: Background(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 160.0),
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logo-pin.png",
                  width: 80,
                  height: 120,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(11, 0, 11, 50),
                child: const Text(
                  'Brota aí',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w500,
                      fontSize: 50,
                      color: Colors.white),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.fromLTRB(22, 34, 22, 34),
                margin: const EdgeInsets.only(left: 11.0, right: 11.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontFamily: 'ABeeZee',
                              color: Colors.black.withOpacity(0.3),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontFamily: 'ABeeZee',
                              color: Colors.black.withOpacity(0.3),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        height: 73,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                              )
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFD6822C),
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'ABeeZee',
                              ),
                            ),
                            onPressed: () {
                              print(emailController.text);
                              print(passwordController.text);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Não tem conta?',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'ABeeZee',
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Cadastre-se',
                      style: TextStyle(
                          color: Color(0xFFD6822C),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'ABeeZee',
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            ),
                          ]),
                    ),
                    onPressed: () {
                      //signup screen
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
