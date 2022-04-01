import 'dart:developer';

import 'package:brota_ai_app/components/drawer.dart';
import 'package:brota_ai_app/components/google-map.dart';
import 'package:brota_ai_app/components/snapping-sheet/snapping-sheet-widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimpleSnappingSheet(
        widgetBackground: GoogleSimpleMap(),
      ),
      drawer: const DrawerMenu(),
    );
  }
}