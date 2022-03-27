import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 2,
      child: Container(
        height: size.height * 0.15,
        margin: const EdgeInsets.only(top: 10.0),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/logo-pin.png",
          height: size.height * 0.25,
          width: size.width * 0.8,
        ),
      ),
      // Container(
      //   height: size.height * 0.15,
      //   alignment: Alignment.center,
      //   padding: const EdgeInsets.fromLTRB(11, 0, 11, 50),
      //   child: const Text(
      //     'Brota aí',
      //     style: TextStyle(
      //       fontStyle: FontStyle.normal,
      //       fontFamily: 'ABeeZee',
      //       fontWeight: FontWeight.w500,
      //       fontSize: 50,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      //   ],
      // ),
    );
  }
}
