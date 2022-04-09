import 'package:brota_ai_app/components/date_input_field.dart';
import 'package:brota_ai_app/components/paleta.dart';
import 'package:brota_ai_app/components/simple_modal.dart';
import 'package:brota_ai_app/models/signup_model.dart';
import 'package:brota_ai_app/services/api_service.dart';
import 'package:brota_ai_app/components/background.dart';
import 'package:brota_ai_app/components/logo.dart';
import 'package:brota_ai_app/components/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewEventScreen extends StatefulWidget {
  static const String id = 'new_event_screen';

  const NewEventScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  SignUpRequestModel requestModel = SignUpRequestModel();

  List<DropdownMenuItem<String>> sexItems = [
    const DropdownMenuItem(child: Text("Masculino"), value: "M"),
    const DropdownMenuItem(child: Text("Feminino"), value: "F"),
    const DropdownMenuItem(child: Text("Prefiro não dizer"), value: "P"),
  ];

  @override
  void initState() {
    super.initState();

    nameController.addListener(handleOnChangeName);
    cpfController.addListener(handleOnChangeCpf);
    emailController.addListener(handleOnChangeEmail);
    passwordController.addListener(handleOnChangePassword);
    confirmPasswordController.addListener(handleOnChangeConfirmPassword);
  }

  @override
  void dispose() {
    nameController.dispose();
    cpfController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    birthDateController.dispose();
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

  void handleOnChangeBirthDate(DateTime? selectedDate) {
    if (selectedDate != null) {
      requestModel.birthDate = selectedDate;
    }
  }

  void handleOnChangeSex(String? selectedValue) {
    if (selectedValue != null) {
      requestModel.sex = selectedValue;
    }
  }

  void handleOnClickSignUpButton() {
    APIService apiService = APIService();

    apiService.signUp(requestModel).then((response) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => SimpleModal(
                message: 'Usuário criado com sucesso.',
                modalTitle: "Sucesso",
                closeButtonText: 'OK',
                closeCallBack: () {
                  Navigator.pop(context);
                },
              ));
    }).catchError((error) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => const SimpleModal(
                message: 'Erro ao se cadastrar.',
                modalTitle: "Erro",
                closeButtonText: 'TENTAR NOVAMENTE',
              ));
    });
  }

  void handleOnPressLogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF198754),
      body: Background(
        child: Column(
          children: <Widget>[
            const Spacer(),
            const Logo(),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                child: Text(
                  'Brota aí',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w500,
                      fontSize: size.height * 0.065,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              height: size.height * 0.5,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextInputField(
                      controller: nameController,
                      icon: FontAwesomeIcons.user,
                      hint: 'Name',
                      maxLength: 255,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: cpfController,
                      icon: FontAwesomeIcons.idCard,
                      hint: 'CPF',
                      maxLength: 11,
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: emailController,
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      maxLength: 255,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: passwordController,
                      icon: FontAwesomeIcons.key,
                      hint: 'Senha',
                      maxLength: 30,
                      isPassword: true,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: confirmPasswordController,
                      icon: FontAwesomeIcons.key,
                      hint: 'Confirme sua Senha',
                      maxLength: 30,
                      isPassword: true,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                    ),
                    DateInputField(
                      controller: birthDateController,
                      icon: FontAwesomeIcons.calendar,
                      hint: 'Data de Nascimento',
                      handleOnChange: handleOnChangeBirthDate,
                    ),
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFFD6822C), width: 2.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                FontAwesomeIcons.genderless,
                                size: 28,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                            hintText: 'Sexo',
                            hintStyle: kHintInputText,
                            filled: true,
                            fillColor: Colors.white,
                            counterText: ''),
                        style: kInputText,
                        //value: 'USA',
                        onChanged: handleOnChangeSex,
                        items: sexItems),
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
                            'Cadastrar-se',
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
                  'Já tem conta?',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'ABeeZee',
                  ),
                ),
                TextButton(
                  child: const Text(
                    'Entre',
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
                  onPressed: handleOnPressLogin,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
