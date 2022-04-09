import 'package:brota_ai_app/components/confirm_modal.dart';
import 'package:brota_ai_app/screens/login.dart';
import 'package:brota_ai_app/screens/new_event.dart';
import 'package:brota_ai_app/services/token_storage_service.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  void _logout(BuildContext context) {
    TokenStorageService.clear();
    Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

  void _handleOnClickLogout(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => ConfirmModal(
              modalTitle: "Sair",
              message: "Deseja realmente sair da aplicação?",
              cancelButtonText: 'CANCELAR',
              confirmButtonText: 'SAIR',
              confirmCallback: () {
                _logout(context);
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF198754),
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            //colocar um Icon
            title: const Text('Criar evento'),
            onTap: () {
              Navigator.pushNamed(context, NewEventScreen.id);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () {
              _handleOnClickLogout(context);
            },
          ),
        ],
      ),
    );
  }
}
