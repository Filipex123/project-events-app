import 'package:brota_ai_app/components/event_card.dart';
import 'package:brota_ai_app/components/my_event_card_model.dart';
import 'package:brota_ai_app/screens/home.dart';
import 'package:brota_ai_app/screens/login.dart';
import 'package:brota_ai_app/services/api_service.dart';
import 'package:brota_ai_app/services/token_storage_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/event_card_model.dart';

class MyEventsScreen extends StatefulWidget {
  static const String id = '';

  const MyEventsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.check_box_sharp),
                text: 'Inscritos',
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.addressBook),
                text: 'Criados',
              ),
            ],
          ),
          title: const Text(
            'Meus eventos',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'ABeeZee',
            ),
          ),
        ),
        body: TabBarView(
          children: [
            const SizedBox(
              height: 160,
              width: 160,
              child: Icon(
                Icons.question_mark,
                size: 160,
              ),
            ),
            SingleChildScrollView(
              child: FutureBuilder(
                future: APIService().getAllEventsByOwner(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: CircularProgressIndicator(
                        value: null,
                        strokeWidth: 7.0,
                      ),
                    );
                  } else {
                    return Column(
                      children: snapshot.data
                          .map<MyEventCard>(
                            (e) => MyEventCard(
                              name: e.name!,
                              dateTime: DateFormat('dd/MM - HH:mm')
                                  .format(e.initialDateTime!),
                              sport: e.sport!,
                              description: e.description!,
                              locale: e.locale,
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
