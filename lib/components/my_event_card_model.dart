import 'package:brota_ai_app/components/confirm_modal.dart';
import 'package:brota_ai_app/components/edit_event_modal.dart';
import 'package:brota_ai_app/screens/event_list.dart';
import 'package:brota_ai_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyEventCard extends StatefulWidget {
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

  const MyEventCard({
    Key? key,
    required this.id,
    this.minAge,
    this.maxAge,
    this.gender,
    required this.name,
    required this.dateTime,
    required this.sport,
    required this.locale,
    required this.description,
    this.updateFunction,
  }) : super(key: key);

  @override
  State<MyEventCard> createState() => _MyEventCardState();
}

class _MyEventCardState extends State<MyEventCard> {
  void _updateScreen() {
    setState(() {});
    widget.updateFunction!();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, EventList.id),
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
          padding: const EdgeInsets.fromLTRB(12, 28, 12, 28),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'ABeeZee',
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        widget.dateTime,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'ABeeZee',
                        ),
                      ),
                      Text(
                        widget.description,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'ABeeZee',
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.sport,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ABeeZee',
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.locale['name'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'ABeeZee',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.only(right: 15),
                    child: InkWell(
                      child: const Icon(
                        FontAwesomeIcons.edit,
                        color: Color(0xFF198754),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white.withOpacity(0.6),
                              titlePadding: const EdgeInsets.all(0),
                              contentPadding: const EdgeInsets.all(0),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              title: Container(
                                color: const Color(0xFF198754),
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(0),
                                margin: const EdgeInsets.all(0),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Editando evento",
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'ABeeZee',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              content: EditEventModal(
                                id: widget.id,
                                name: widget.name,
                                dateTime: widget.dateTime,
                                minAge: widget.minAge,
                                maxAge: widget.maxAge,
                                sport: widget.sport,
                                locale: widget.locale['name'],
                                description: widget.description,
                                gender: widget.gender,
                                updateFunction: _updateScreen,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.only(right: 15),
                    child: InkWell(
                      child: const Icon(
                        FontAwesomeIcons.trash,
                        color: Color(0xFF198754),
                      ),
                      onTap: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => ConfirmModal(
                                  modalTitle: "Excluir",
                                  message:
                                      "Deseja realmente excluir este evento?",
                                  cancelButtonText: 'CANCELAR',
                                  confirmButtonText: 'EXCLUIR',
                                  confirmCallback: () {
                                    APIService().deleteEvent(widget.id);
                                    setState(() {});
                                    widget.updateFunction!();
                                  },
                                ));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: const Color.fromARGB(255, 215, 215, 215),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(3, 6), // Shadow position
              ),
            ],
          ),
        ),
      ),
    );
  }
}
