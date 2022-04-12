import 'package:brota_ai_app/components/background.dart';
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
           DrawerHeader(
            decoration: const BoxDecoration(
                 color: Color(0xFF198754),
            ),
            
            child: Image.asset('assets/images/perfil.png'),            
          ),
          ListTile(                     
            leading: Icon(Icons.add),
            title: const Text('Criar evento'),
            onTap: () {              
              Navigator.pushNamed(context, NewEventScreen.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: const Text('Meus Eventos'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Editar Evento'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
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
