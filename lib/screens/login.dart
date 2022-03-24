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
            Container(
              padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
              margin: const EdgeInsets.only(left: 11.0, right: 11.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFD6822C), // Background color
                      ),
                      child: const Text('Entrar'),
                      onPressed: () {
                        print(emailController.text);
                        print(passwordController.text);
                      },
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Não tem conta?'),
                TextButton(
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(
                      color: Color(0xFFD6822C),
                    ),
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
