import 'package:flutter/material.dart';

import '../components/google-map.dart';

class JoinEventScreen extends StatefulWidget {
  static const String id = 'joinr_event_escreen';

  @override
  State<JoinEventScreen> createState() => _JoinEventScreenState();
}

class _JoinEventScreenState extends State<JoinEventScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130.0,
        titleSpacing: 0,
        backgroundColor: const Color(0xFF125C3A),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nome do evento',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            Image.asset(
              "assets/images/laterallogo.png",
              height: 130,
              width: 130,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.27,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(3)),
              color: Colors.black.withOpacity(0.09),
              border: Border.all(),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  blurRadius: 10,
                  offset: const Offset(3, 6),
                ),
              ],
            ),
            child: const SingleChildScrollView(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '"Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker."',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          const Text(
            "Localizacao",
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: 'ABeeZee',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black),
          ),
          const Text(
            "Rua fulana de tal",
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: 'ABeeZee',
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.black),
          ),
          Container(
            width: size.width,
            height: size.height * 0.38,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: GoogleSimpleMap(),
            //colocar mapa aqui
          ),
          Container(
            padding: const EdgeInsets.only(top: 4),
            height: size.height * 0.075,
            child: SizedBox(
              height: size.height * 0.075,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFD6822C),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Participar',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'ABeeZee',
                    ),
                  ),
                  onPressed: () => {}),
            ),
          ),
        ],
      ),
    );
  }
}
