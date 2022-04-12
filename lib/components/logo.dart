import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        height: size.height * 0.15,
        margin: const EdgeInsets.only(top: 0),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/logo-pin.png",
          height: size.height * 0.25,
          width: size.width * 0.8,
        ),
      ),
    );
  }
}
