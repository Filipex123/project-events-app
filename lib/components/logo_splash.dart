import 'package:flutter/cupertino.dart';

class LogoSplash extends StatelessWidget {
  const LogoSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/logo.png",
            height: 180.0,
          ),
          const Text(
            'Brota ai',
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: 'EastSeaDokdo',
                fontSize: 90,
                color: Color(0xFF198754)),
          ),
        ],
      ),
    );
  }
}
