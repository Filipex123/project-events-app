import 'package:brota_ai_app/components/background.dart';
import 'package:brota_ai_app/components/logo.dart';
import 'package:brota_ai_app/components/text_input_field.dart';
import 'package:brota_ai_app/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF198754),
        body: Background(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: const Logo(),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.topCenter,
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
              ),
              Container(
                height: size.height * 0.4,
                padding: const EdgeInsets.fromLTRB(22, 28, 22, 34),
                margin: const EdgeInsets.only(left: 13.0, right: 13.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const TextInputField(
                        icon: Icons.email,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      const TextInputField(
                        icon: Icons.password,
                        hint: 'Senha',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        height: size.height * 0.1,
                        child: Container(
                          height: size.height * 0.1,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignupScreen())); //signup screen
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
