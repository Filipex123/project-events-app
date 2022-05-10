import 'package:brota_ai_app/screens/join_event_screen.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String name;
  final String dateTime;
  final String sport;

  const EventCard(
      {Key? key,
      required this.name,
      required this.dateTime,
      required this.sport})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'ABeeZee',
                          ))
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(dateTime,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'ABeeZee',
                        ))
                  ],
                )
              ],
            ),
            Row(
              children: [
                Text(
                  sport,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'ABeeZee',
                    color: Colors.black.withOpacity(0.4),
                  ),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Colors.black.withOpacity(0.05),
        ),
      ),
      onTap: () => {Navigator.pushNamed(context, JoinEventScreen.id)},
    );
  }
}
