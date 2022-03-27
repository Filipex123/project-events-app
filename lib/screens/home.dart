import 'dart:developer';

import 'package:brota_ai_app/services/token_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  void _logout() {
    TokenStorageService.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'ta logado'
        ),
        ElevatedButton(onPressed: _logout, child: Text(
          'deslogar'
        ))
      ],
    );
  }
}
