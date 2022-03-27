import 'dart:developer';

import 'package:brota_ai_app/models/signup_model.dart';
import 'package:brota_ai_app/screens/login.dart';
import 'package:brota_ai_app/services/api_service.dart';
import 'package:brota_ai_app/components/background.dart';
import 'package:brota_ai_app/components/logo.dart';
import 'package:brota_ai_app/components/text_input_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'signup_screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  SignUpRequestModel requestModel = SignUpRequestModel(name: '', cpf: '', email: '', password: '', confirmPassword: '', age: 0);

  @override
  void initState() {
    super.initState();

    nameController.addListener(handleOnChangeName);
    cpfController.addListener(handleOnChangeCpf);
    emailController.addListener(handleOnChangeEmail);
    passwordController.addListener(handleOnChangePassword);
    confirmPasswordController.addListener(handleOnChangeConfirmPassword);
    ageController.addListener(handleOnChangeAge);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleOnChangeName() {
    requestModel.name = nameController.text;
  }

  void handleOnChangeCpf() {
    requestModel.cpf = cpfController.text;
  }

  void handleOnChangeEmail() {
    requestModel.email = emailController.text;
  }

  void handleOnChangePassword() {
    requestModel.password = passwordController.text;
  }

  void handleOnChangeConfirmPassword() {
    requestModel.confirmPassword = confirmPasswordController.text;
  }

   void handleOnChangeAge() {
    if(ageController.text != ''){
      requestModel.age = int.parse(ageController.text);
    }
  }

  void handleOnClickSignUpButton() {
    log(requestModel.toJson().toString());
    APIService apiService = APIService();

    apiService.signUp(requestModel).then((response) {
      log('certo');
    }).catchError((error) {
      log(error.error);
      log('failed');
    });
  }

  void handleOnPressLogin(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.id);
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
                height: size.height * 1,
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextInputField(
                        controller: nameController,
                        icon: Icons.person,
                        hint: 'Name',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        controller: cpfController,
                        icon: Icons.card_travel,
                        hint: 'CPF',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        controller: emailController,
                        icon: Icons.email,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      
                      TextInputField(
                        controller: passwordController,
                        icon: Icons.password,
                        hint: 'Senha',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        controller: confirmPasswordController,
                        icon: Icons.password,
                        hint: 'Confirme sua Senha',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        controller: ageController,
                        icon: Icons.password,
                        hint: 'Idade',
                        inputType: TextInputType.number,
                        inputAction: TextInputAction.next,
                      ),
                      Container(
                        
                        padding: const EdgeInsets.only(top: 4),
                        height: size.height * 0.075,
                        child: Container(
                          height: size.height * 0.075,
                          // decoration: BoxDecoration(
                          //   boxShadow: [
                          //     BoxShadow(
                          //       color: Colors.black.withOpacity(0.25),
                          //       spreadRadius: 1,
                          //       blurRadius: 4,
                          //       offset: const Offset(0, 4),
                          //     )
                          //   ],
                          // ),
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
                            onPressed: handleOnClickSignUpButton,
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
                      handleOnPressLogin(context);
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
