import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nome do Evento',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'ABeeZee',
                        ))
                  ],
                ),
              ),
              Column(
                children: [
                  const Text('12:30',
                      style: TextStyle(
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
                'Esporte do evento',
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
    );
  }
}
