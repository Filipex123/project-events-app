import 'dart:developer';

import 'package:brota_ai_app/components/address_search.dart';
import 'package:brota_ai_app/components/date_time_input_field.dart';
import 'package:brota_ai_app/components/paleta.dart';
import 'package:brota_ai_app/components/simple_modal.dart';
import 'package:brota_ai_app/models/event_model.dart';
import 'package:brota_ai_app/models/sport_model.dart';
import 'package:brota_ai_app/services/api_service.dart';
import 'package:brota_ai_app/components/text_input_field.dart';
import 'package:brota_ai_app/services/google_place_service.dart';
import 'package:brota_ai_app/utils/globals.dart';
import 'package:brota_ai_app/utils/validations/new_event_validation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

class NewEventScreen extends StatefulWidget {
  static const String id = 'new_event_screen';

  const NewEventScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  TextEditingController minAgeController = TextEditingController();
  TextEditingController maxAgeController = TextEditingController();
  TextEditingController localeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();

  EventRequestModel requestModel = EventRequestModel();
  GooglePlaceService googlePlace = GooglePlaceService();

  List<DropdownMenuItem<String>> genderItems = [
    const DropdownMenuItem(child: Text("Masculino"), value: "M"),
    const DropdownMenuItem(child: Text("Feminino"), value: "F"),
    const DropdownMenuItem(child: Text("Qualquer um"), value: "P"),
  ];

  @override
  void initState() {
    super.initState();

    nameController.addListener(handleOnChangeName);
    minAgeController.addListener(handleOnChangeMinAge);
    maxAgeController.addListener(handleOnChangeMaxAge);
    descriptionController.addListener(handleOnChangeDescription);
  }

  @override
  void dispose() {
    nameController.dispose();
    minAgeController.dispose();
    maxAgeController.dispose();
    localeController.dispose();
    descriptionController.dispose();
    eventDateController.dispose();
    super.dispose();
  }

  List<DropdownMenuItem<String>> _getDropdownSportsItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (var i = 0; i < sportList.length; i++) {
      dropdownItems.add(DropdownMenuItem(
          child: Text(sportList[i]["name"]),
          value: sportList[i]["id"] as String));
    }
    return dropdownItems;
  }

  void handleOnChangeName() {
    requestModel.name = nameController.text;
  }

  void handleOnChangeSport(String? selectedValue) {
    if (selectedValue != null) {
      var sport = SportModel();
      sport.id = selectedValue;
      requestModel.sport = sport;
    }
  }

  void handleOnChangeMinAge() {
    requestModel.minAge = int.parse(minAgeController.text);
  }

  void handleOnChangeMaxAge() {
    requestModel.maxAge = int.parse(maxAgeController.text);
  }

  void handleOnTapLocale() async {
    final result = await showSearch(
      context: context,
      delegate: AddressSearch(),
    );
    if (result != null) {
      localeController.text = result.name ?? '';
      requestModel.locale = {
        'name': result.name,
        'id': result.placeId,
        'lat': result.geometry?.location?.lat,
        'lng': result.geometry?.location?.lng
      };
    }
  }

  void handleOnChangeDescription() {
    requestModel.description = descriptionController.text;
  }

  void handleOnChangeDate() {
    requestModel.initialDateTime = eventDateController.text;
  }

  void handleOnChangeSex(String? selectedValue) {
    if (selectedValue != null) {
      requestModel.gender = selectedValue;
    }
  }

  void handleOnClickRegisterButton() {
    log("Request sendo enviado: " + requestModel.toJson().toString());
    List<String> errors = NewEventValidation().validate(requestModel);

    if (errors.isNotEmpty) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => SimpleModal(
                message: errors.join('\n'),
                modalTitle: "Erro de preenchimento",
                closeButtonText: 'OK',
              ));
      return;
    }
    APIService apiService = APIService();

    apiService.registerEvent(requestModel).then((response) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => SimpleModal(
                message: 'Evento criado com sucesso.',
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
                message: 'Erro ao criar Evento.',
                modalTitle: "Erro",
                closeButtonText: 'TENTAR NOVAMENTE',
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
              height: size.height * 0.73,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              margin: const EdgeInsets.only(left: 16, right: 16),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Icon(
                                  FontAwesomeIcons.genderless,
                                  size: 28,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                              hintText: 'Esporte',
                              hintStyle: kHintInputText,
                              filled: true,
                              fillColor: Colors.white,
                              counterText: ''),
                          style: kInputText,
                          //value: 'USA',
                          onChanged: handleOnChangeSport,
                          items: _getDropdownSportsItems()),
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
                      readOnly: true,
                      handleOnTap: handleOnTapLocale,
                    ),
                    Row(
                      children: [
                        TextInputField(
                          controller: minAgeController,
                          hint: 'Idade mínima',
                          hadWidth: 250,
                          maxLength: 2,
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.next,
                        ),
                        const Spacer(),
                        TextInputField(
                          controller: maxAgeController,
                          hint: 'Idade máxima',
                          hadWidth: 250,
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
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
                          items: genderItems),
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
                          onPressed: handleOnClickRegisterButton,
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
