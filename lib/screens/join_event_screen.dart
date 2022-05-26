import 'dart:convert';

import 'package:brota_ai_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../components/google-map.dart';
import '../components/simple_modal.dart';
import '../models/event_card_model.dart';

class JoinEventScreen extends StatefulWidget {
  static const String id = 'join_event_escreen';

  const JoinEventScreen({Key? key}) : super(key: key);

  @override
  State<JoinEventScreen> createState() => _JoinEventScreenState();
}

class _JoinEventScreenState extends State<JoinEventScreen> {
  String eventId = GetIt.I<EventResponseCardModel>().id!;


  void _handleOnClickToggleButton(bool isParticipation) {

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130.0,
        titleSpacing: 0,
        backgroundColor: const Color(0xFF125C3A),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                GetIt.I<EventResponseCardModel>().name!,
                style: const TextStyle(
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
      body: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.27,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(3)),
              color: Colors.black.withOpacity(0.09),
              border: Border.all(),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  blurRadius: 10,
                  offset: const Offset(3, 6),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  GetIt.I<EventResponseCardModel>().description ?? "",
                  style: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          Text(
            GetIt.I<EventResponseCardModel>().locale!["name"] ?? "",
            style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: 'ABeeZee',
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.black),
          ),
          Container(
            width: size.width,
            height: size.height * 0.3,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: GoogleSimpleMap(
              lat: double.parse(GetIt.I<EventResponseCardModel>().locale!["lat"]),
              lng: double.parse(GetIt.I<EventResponseCardModel>().locale!["lng"]),
              //zoom: 2.5,
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
                  child: Text(
                    GetIt.I<EventResponseCardModel>().participating ?? false ? 'Cancelar participação' : 'Participar',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'ABeeZee',
                    ),
                  ),
                  onPressed: () {
                    if (GetIt.I<EventResponseCardModel>().participating ?? false) {
                      _unjoinEvent();
                    } else {
                      _joinEvent();
                    }
                  },
            ),
          ),
          )
        ],
      ),
    );
  }

  _unjoinEvent() {
    APIService()
      .unjoinEvent(eventId)
      .then((value) => {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) => SimpleModal(
                  message: 'presença cancelado com sucesso.',
                  modalTitle: "Sucesso",
                  closeButtonText: 'OK',
                  closeCallBack: () {
                    Navigator.pop(context);
                  },
                ),
              )
            });

  }

  _joinEvent() {
    APIService()
        .joinEvent(eventId)
        .then((value) => {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) => SimpleModal(
                  message: 'Inscrito no evento com sucesso.',
                  modalTitle: "Sucesso",
                  closeButtonText: 'OK',
                  closeCallBack: () {
                    Navigator.pop(context);
                  },
                ),
              )
            })
        .catchError((error) => {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) => SimpleModal(
                  message:
                      'Erro ao se inscrever no evento:\n${(json.decode(error.body))["message"]}',
                  modalTitle: "Erro",
                  closeButtonText: 'TENTAR NOVAMENTE',
                ),
              ),
            });
  }
}
