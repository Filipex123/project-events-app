import 'package:brota_ai_app/models/user_model.dart';
import 'package:brota_ai_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EventList extends StatefulWidget {
  static const String id = 'event_list_screen';

  const EventList({Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final Future<List<UsersModel>> _usersFuture =
      APIService().getJoinedUsers(GetIt.I<UsersModel>().id!);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista Usuarios',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontFamily: 'ABeeZee',
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFF198754),
              image: DecorationImage(
                alignment: Alignment.centerRight,
                image: AssetImage('assets/images/lateralDrawer.png'),
              )),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: _usersFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: CircularProgressIndicator(
                    value: null,
                    strokeWidth: 7.0,
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: snapshot.data
                        .map<ListTile>(
                          (e) => ListTile(
                            leading: const Icon(Icons.account_circle),
                            title: Text(e!.name),
                            subtitle: Text(yearsCalculated(e)),
                          ),
                        )
                        .toList(),
                  ),
                );
              }
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFD6822C),
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Voltar',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'ABeeZee',
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  String yearsCalculated(e) {
    return (DateTime.now().year - e!.birthDate.year).toString() + " anos";
  }
}
