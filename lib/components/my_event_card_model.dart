import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyEventCard extends StatelessWidget {
  final String name;
  final String dateTime;
  final String sport;
  final String locale;
  final String description;

  const MyEventCard({
    Key? key,
    required this.name,
    required this.dateTime,
    required this.sport,
    required this.locale,
    required this.description,
  }) : super(key: key);

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
                        name,
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
                      dateTime,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'ABeeZee',
                      ),
                    ),
                    Text(
                      description,
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
                  sport,
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
                  locale,
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
                      print('Ir para a tela de edição de evento');
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
                      print('Ir para a tela de deleção de evento');
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
    );
  }
}
