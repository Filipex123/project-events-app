import 'package:brota_ai_app/screens/home.dart';
import 'package:brota_ai_app/screens/login.dart';
import 'package:brota_ai_app/screens/my_splash_screen.dart';
import 'package:brota_ai_app/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brota aí',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MySplashScreen(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}