import 'package:brota_ai_app/screens/home.dart';
import 'package:brota_ai_app/screens/login.dart';
import 'package:brota_ai_app/screens/my_splash_screen.dart';
import 'package:brota_ai_app/screens/new_event.dart';
import 'package:brota_ai_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
          colorScheme: const ColorScheme.light(
        primary: Color(0xFF198754),
      )),
      home: HomeScreen(),
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        NewEventScreen.id: (context) => const NewEventScreen(),
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
