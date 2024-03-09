import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 150,
            left: 0,
            child: Image.asset(
              "assets/images/bolabasquete.png",
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/bolafutebol.png",
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
            child: Image.asset("assets/images/bolatenis.png"),
          ),
          Positioned(
            top: 240,
            right: 0,
            child: Image.asset("assets/images/bolavolei.png"),
          ),
          Positioned(
            top: 240,
            left: 0,
            child: Image.asset("assets/images/Raquete.png"),
          ),
          child
        ],
      ),
    );
  }
}
