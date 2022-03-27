import 'dart:developer';

import 'package:brota_ai_app/screens/home.dart';
import 'package:brota_ai_app/services/api_service.dart';
import 'package:brota_ai_app/components/background.dart';
import 'package:brota_ai_app/components/logo.dart';
import 'package:brota_ai_app/components/simple_modal.dart';
import 'package:brota_ai_app/components/text_input_field.dart';
import 'package:brota_ai_app/models/login_model.dart';
import 'package:brota_ai_app/screens/signup.dart';
import 'package:brota_ai_app/services/token_storage_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginRequestModel requestModel = LoginRequestModel(email: '', password: '');

  @override
  void initState() {
    super.initState();

    emailController.addListener(handleOnChangeEmail);
    passwordController.addListener(handleOnChangePassword);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleOnChangeEmail() {
    requestModel.email = emailController.text;
  }

  void handleOnChangePassword() {
    requestModel.password = passwordController.text;
  }

  void handleOnClickLoginButton() async {
    log(requestModel.toJson().toString());
    APIService apiService = APIService();

    apiService.login(requestModel).then(( response ) {
      TokenStorageService.store(response.token);
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    }).catchError(( error ) {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleModal(text: error.error ?? '');
        }
      );
    });
  }

  void handleOnPressSignUp(BuildContext context) {
    Navigator.pushNamed(context, SignUpScreen.id);
  }

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
                height: size.height * 0.3,
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextInputField(
                        controller: emailController,
                        icon: Icons.email,
                        hint: 'Email',
                        maxLength: 255,
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        controller: passwordController,
                        icon: Icons.password,
                        hint: 'Senha',
                        maxLength: 30,
                        isPassword: true,
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.done,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 4),
                        height: size.height * 0.075,
                        child: Container(
                          height: size.height * 0.075,
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
                            onPressed: handleOnClickLoginButton,
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
                      handleOnPressSignUp(context);
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
