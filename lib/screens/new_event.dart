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
import 'package:flutter/services.dart';

class NewEventScreen extends StatefulWidget {
  static const String id = 'new_event_screen';

  const NewEventScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  TextEditingController minAge = TextEditingController();
  TextEditingController maxAge = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController sportController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();

  SignUpRequestModel requestModel = SignUpRequestModel();

  List<DropdownMenuItem<String>> sexItems = [
    const DropdownMenuItem(child: Text("Masculino"), value: "M"),
    const DropdownMenuItem(child: Text("Feminino"), value: "F"),
    const DropdownMenuItem(child: Text("Qualquer um"), value: "P"),
  ];

  @override
  void initState() {
    super.initState();

    nameController.addListener(handleOnChangeName);
    sportController.addListener(handleOnChangeCpf);
    minAge.addListener(handleOnChangeEmail);
    passwordController.addListener(handleOnChangePassword);
    confirmPasswordController.addListener(handleOnChangeConfirmPassword);
  }

  @override
  void dispose() {
    nameController.dispose();
    sportController.dispose();
    minAge.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    eventDateController.dispose();
    super.dispose();
  }

  void handleOnChangeName() {
    requestModel.name = nameController.text;
  }

  void handleOnChangeCpf() {
    requestModel.cpf = sportController.text;
  }

  void handleOnChangeEmail() {
    requestModel.email = minAge.text;
  }

  void handleOnChangePassword() {
    requestModel.password = passwordController.text;
  }

  void handleOnChangeConfirmPassword() {
    requestModel.confirmPassword = confirmPasswordController.text;
  }

  void handleOnChangeDate(DateTime? selectedDate) {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF198754),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            toolbarHeight: 130.0,
            titleSpacing: 0,
            backgroundColor: const Color(0xFF125C3A),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Criar evento',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontFamily: 'ABeeZee',
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
                Image.asset(
                  "assets/images/laterallogo.png",
                  height: 130,
                  width: 130,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            const Spacer(),
            Container(
              height: size.height * 0.75,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextInputField(
                      controller: nameController,
                      icon: FontAwesomeIcons.pen,
                      hint: 'Name',
                      maxLength: 255,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: sportController,
                      icon: FontAwesomeIcons.basketballBall,
                      hint: 'Esporte',
                      maxLength: 11,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                    ),
                    Row(
                      children: [
                        TextInputField(
                          controller: minAge,
                          hint: 'Idade mínima',
                          hadWidth: 250,
                          maxLength: 2,
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.next,
                        ),
                        const Spacer(),
                        TextInputField(
                          controller: maxAge,
                          hint: 'Idade máxima',
                          hadWidth: 250,
                          maxLength: 2,
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                    TextInputField(
                      controller: passwordController,
                      icon: FontAwesomeIcons.mapSigns,
                      hint: 'Localização',
                      maxLength: 30,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: confirmPasswordController,
                      icon: FontAwesomeIcons.key,
                      hint: 'Confirme sua Senha',
                      maxLength: 30,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                    ),
                    Row(
                      children: [
                        DateInputField(
                          controller: eventDateController,
                          icon: FontAwesomeIcons.calendar,
                          hint: 'Data',
                          hadWidth: 250,
                          handleOnChange: handleOnChangeDate,
                        ),
                        const Spacer(),
                        DateInputField(
                          controller: eventDateController,
                          icon: FontAwesomeIcons.clock,
                          hint: 'Hora',
                          hadWidth: 250,
                          handleOnChange: handleOnChangeDate,
                        ),
                      ],
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
                            hintText: 'Gênero',
                            hintStyle: kHintInputText,
                            filled: true,
                            fillColor: Colors.white,
                            counterText: ''),
                        style: kInputText,
                        //value: 'USA',
                        onChanged: handleOnChangeSex,
                        items: sexItems),
                    TextInputField(
                      controller: confirmPasswordController,
                      icon: FontAwesomeIcons.readme,
                      hint: 'Descrição',
                      maxLength: 30,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 4),
                      height: size.height * 0.075,
                      child: SizedBox(
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
                            'Criar',
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
            const Spacer()
          ],
        ),
      ),
    );
  }
}
