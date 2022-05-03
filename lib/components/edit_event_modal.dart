import 'dart:developer';

import 'package:brota_ai_app/components/paleta.dart';
import 'package:brota_ai_app/components/simple_modal.dart';
import 'package:brota_ai_app/components/text_input_field.dart';
import 'package:brota_ai_app/models/event_card_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../services/api_service.dart';

import 'date_time_input_field.dart';

class EditEventModal extends StatefulWidget {
  final String id;
  final String name;
  final String dateTime;
  final String? minAge;
  final String? maxAge;
  final String sport;
  final Map<String, dynamic> locale;
  final String description;
  final String? gender;
  final Function? updateFunction;

  const EditEventModal(
      {Key? key,
      required this.id,
      required this.name,
      required this.dateTime,
      this.minAge,
      this.maxAge,
      required this.sport,
      required this.locale,
      required this.description,
      this.gender,
      this.updateFunction})
      : super(key: key);

  @override
  State<EditEventModal> createState() => _EditEventModalState();
}

class _EditEventModalState extends State<EditEventModal> {
  TextEditingController minAgeController = TextEditingController();
  TextEditingController maxAgeController = TextEditingController();
  TextEditingController localeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController sportController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();

  EventRequestCardModel requestModel = EventRequestCardModel();

  List<DropdownMenuItem<String>> genderItems = [
    const DropdownMenuItem(child: Text("Masculino"), value: "M"),
    const DropdownMenuItem(child: Text("Feminino"), value: "F"),
    const DropdownMenuItem(child: Text("Qualquer um"), value: "P"),
  ];

  @override
  void initState() {
    super.initState();

    nameController.addListener(handleOnChangeName);
    nameController.text = widget.name;
    sportController.addListener(handleOnChangeSport);
    sportController.text = widget.sport;
    minAgeController.addListener(handleOnChangeMinAge);
    minAgeController.text = widget.minAge ?? "";
    maxAgeController.addListener(handleOnChangeMaxAge);
    maxAgeController.text = widget.maxAge ?? "";
    localeController.addListener(handleOnChangeLocale);
    localeController.text = widget.locale['name'];
    descriptionController.addListener(handleOnChangeDescription);
    descriptionController.text = widget.description;
    eventDateController.text = widget.dateTime;
    requestModel.gender = widget.gender;

    var dateTime = DateFormat('dd/MM - HH:mm yyyy')
        .parse(widget.dateTime + " " + DateTime.now().year.toString());

    requestModel.initialDateTime = dateTime.toString();
  }

  @override
  void dispose() {
    nameController.dispose();
    sportController.dispose();
    minAgeController.dispose();
    maxAgeController.dispose();
    localeController.dispose();
    descriptionController.dispose();
    eventDateController.dispose();
    super.dispose();
  }

  void handleOnChangeName() {
    requestModel.name = nameController.text;
  }

  void handleOnChangeSport() {
    requestModel.sport = sportController.text;
  }

  void handleOnChangeMinAge() {
    requestModel.minAge =
        (minAgeController.text == "") ? null : minAgeController.text;
  }

  void handleOnChangeMaxAge() {
    requestModel.maxAge =
        (maxAgeController.text == "") ? null : maxAgeController.text;
  }

  void handleOnChangeLocale() {
    requestModel.locale = localeController.text;
  }

  void handleOnChangeDescription() {
    requestModel.description = descriptionController.text;
  }

  void handleOnChangeDate() {
    requestModel.initialDateTime = eventDateController.text;
  }

  void handleOnChangeGender(String? selectedValue) {
    if (selectedValue != null) {
      requestModel.gender = selectedValue;
    }
  }

  void handleOnClickEditButton() {
    APIService apiService = APIService();
    requestModel.id = widget.id;
    log("Request sendo enviado: " + requestModel.toJson().toString());

    apiService.updateEvent(requestModel).then((result) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => SimpleModal(
                message: 'Evento editado com sucesso.',
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
                message: 'Erro ao editar evento Evento.',
                modalTitle: "Erro",
                closeButtonText: 'TENTAR NOVAMENTE',
              ));
    });
    setState(() {});
    widget.updateFunction!();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 1,
        height: MediaQuery.of(context).size.height - 50,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(0),
        // color: Colors.white.withOpacity(0.3),
        child: Column(
          children: <Widget>[
            const Spacer(),
            Container(
              height: size.height * 0.73,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              margin: const EdgeInsets.all(0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextInputField(
                      controller: nameController,
                      icon: FontAwesomeIcons.pen,
                      hint: 'Nome',
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
                    TextInputField(
                      controller: descriptionController,
                      icon: FontAwesomeIcons.readme,
                      hint: 'Descrição',
                      maxLength: 255,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: localeController,
                      icon: FontAwesomeIcons.mapSigns,
                      hint: 'Localização',
                      maxLength: 30,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                    ),
                    Row(
                      children: [
                        TextInputField(
                          controller: minAgeController,
                          hint: 'Idade mínima',
                          hadWidth: 270,
                          maxLength: 2,
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.next,
                        ),
                        const Spacer(),
                        TextInputField(
                          controller: maxAgeController,
                          hint: 'Idade máxima',
                          hadWidth: 270,
                          maxLength: 2,
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                    BasicDateTimeField(
                      dateTimeController: eventDateController,
                      handleOnChange: handleOnChangeDate,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: DropdownButtonFormField(
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
                        onChanged: handleOnChangeGender,
                        items: genderItems,
                        value: widget.gender,
                      ),
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
                            'Finalizar',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'ABeeZee',
                            ),
                          ),
                          onPressed: handleOnClickEditButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.0),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
