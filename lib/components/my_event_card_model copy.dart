import 'package:brota_ai_app/components/confirm_modal.dart';
import 'package:brota_ai_app/components/edit_event_modal.dart';
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
    return SingleChildScrollView(
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
                      widget.description.toString().length > 30 ?
                    widget.description.toString().substring(0, 30) + "..." :
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
                  widget.locale['name'].toString().length > 30 ?
                    widget.locale['name'].toString().substring(0, 30) + "..." :
                    widget.locale['name'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'ABeeZee',
                  ),
                  overflow: TextOverflow.ellipsis,
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
              offset: const Offset(3, 6),
            ),
          ],
        ),
      ),
    );
  }
}
