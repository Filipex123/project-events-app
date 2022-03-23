import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:brota_ai_app/components/logo_splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../main.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const LogoSplash(),
      duration: 90000,
      nextScreen: const MyHomePage(
        title: "Estamos na home",
      ),
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.black,
    );
  }
}
