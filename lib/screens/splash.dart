import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:brota_ai_app/components/logo_splash.dart';
import 'package:brota_ai_app/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const LogoSplash(),
      duration: 2000,
      nextScreen: Login(),
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.black,
    );
  }
}
