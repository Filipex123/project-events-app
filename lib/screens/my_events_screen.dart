import 'package:brota_ai_app/components/my_event_card_model.dart';
import 'package:brota_ai_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/event_card_model.dart';

class MyEventsScreen extends StatefulWidget {
  static const String id = 'myEventScreen';

  const MyEventsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  Future<List<EventResponseCardModel>> _eventsFuture =
      APIService().getAllEventsByOwner();

  Future<List<EventResponseCardModel>> _eventsJoinedFuture =
      APIService().getJoinedEvents();

  void _updateScreen() {
    setState(() {
      _eventsFuture = APIService().getAllEventsByOwner();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF198754),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            toolbarHeight: 200.0,
            titleSpacing: 0,
            backgroundColor: const Color(0xFF125C3A),
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Meus eventos',
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
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: FutureBuilder(
                future: _eventsJoinedFuture,
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
                              id: e.id,
                              name: e.name!,
                              minAge:
                                  (e.minAge != null) ? e.minAge.toString() : "",
                              maxAge:
                                  (e.maxAge != null) ? e.maxAge.toString() : "",
                              gender: e.gender ?? "P",
                              dateTime: DateFormat('dd/MM - HH:mm')
                                  .format(e.initialDateTime!),
                              sport: e.sport!.name,
                              description: e.description!,
                              locale: e.locale,
                              updateFunction: _updateScreen,
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
            ),
            SingleChildScrollView(
              child: FutureBuilder(
                future: _eventsFuture,
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
                              id: e.id,
                              name: e.name!,
                              minAge:
                                  (e.minAge != null) ? e.minAge.toString() : "",
                              maxAge:
                                  (e.maxAge != null) ? e.maxAge.toString() : "",
                              gender: e.gender ?? "P",
                              dateTime: DateFormat('dd/MM - HH:mm')
                                  .format(e.initialDateTime!),
                              sport: e.sport!.name,
                              description: e.description!,
                              locale: e.locale,
                              updateFunction: _updateScreen,
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
