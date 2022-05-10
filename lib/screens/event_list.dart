import 'package:flutter/material.dart';

import '../components/text_input_field.dart';

class EventList extends StatelessWidget {
  const EventList({Key? key}) : super(key: key);
  static const String id = 'event_list_screen';

  @override
  Widget build(BuildContext context) {   
    
    return MaterialApp(     
      home: Scaffold(
        appBar: AppBar(
        title: Text('Lista Usuarios', style: TextStyle(
           fontStyle: FontStyle.normal,
           fontFamily: 'ABeeZee',
           fontWeight: FontWeight.w500,
           fontSize: 20,
           color: Colors.white,            
        ),) ,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF198754),
              image: DecorationImage(
                  alignment: Alignment.centerRight,
                  image: AssetImage('assets/images/lateralDrawer.png'),                  
              )
          ),
        ),

      ),
        body: Column(
          children: [
            Flexible(
              flex: 6,
              child: ListView(
                
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Nome'),
                    subtitle: Text('Idade'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Nome'),
                    subtitle: Text('Idade'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Nome'),
                    subtitle: Text('Idade'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Nome'),
                    subtitle: Text('Idade'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Nome'),
                    subtitle: Text('Idade'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Nome'),
                    subtitle: Text('Idade'),
                  ),
                ],
              ),
            ),
             Flexible(
               flex: 1,
               child: ElevatedButton(
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
                  onPressed: ()=>Navigator.pop(context),
             )
            )
          ],
        ),
      ),
    );
  }
}
