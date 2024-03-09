import 'package:brota_ai_app/components/confirm_modal.dart';
import 'package:brota_ai_app/models/user_model.dart';
import 'package:brota_ai_app/screens/login.dart';
import 'package:brota_ai_app/screens/my_events_screen.dart';
import 'package:brota_ai_app/screens/new_event.dart';
import 'package:brota_ai_app/services/token_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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

  String getImageProfile() {
    String name = GetIt.I<UsersModel>().name ?? "";

    var nameArray = name.split(' ');

    String firstName = nameArray[0];
    String secondName = nameArray[1];
    return ('${firstName[0]}${secondName[0]}');
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
              image: DecorationImage(
                alignment: Alignment.centerRight,
                image: AssetImage("assets/images/lateralDrawer.png"),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 0),
                      height: 90,
                      margin: const EdgeInsets.only(top: 0),
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          child: Text(
                            getImageProfile(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Text(
                        GetIt.I<UsersModel>().name ?? 'Usuário Logado',
                        style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontFamily: 'ABeeZee',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text(
              'Criar evento',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: 'ABeeZee',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, NewEventScreen.id);
            },
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text(
              'Meus Eventos',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: 'ABeeZee',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, MyEventsScreen.id);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Configurações',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: 'ABeeZee',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            focusColor: const Color(0xFFD6822C),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              'Sair',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: 'ABeeZee',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {
              _handleOnClickLogout(context);
            },
          ),
        ],
      ),
    );
  }
}
