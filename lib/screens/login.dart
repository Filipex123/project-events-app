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
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF198754),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 160.0),
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/logo-pin.png",
                      width: 80,
                      height: 120,
                    )),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(11, 0, 11, 50),
              child: const Text(
                'Brota ai',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontFamily: 'EastSeaDokdo',
                    fontWeight: FontWeight.w500,
                    fontSize: 70,
                    color: Colors.white),
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
              margin: const EdgeInsets.only(left: 11.0, right: 11.0),
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
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFD6822C),
                          minimumSize: const Size.fromHeight(50),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 20,
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
                  ),
                ),
                TextButton(
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(
                        color: Color(0xFFD6822C),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
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
    );
  }
}
