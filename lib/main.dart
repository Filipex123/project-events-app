import 'package:brota_ai_app/models/user_model.dart';
import 'package:brota_ai_app/screens/edit_event_screen.dart';
import 'package:brota_ai_app/screens/event_list.dart';
import 'package:brota_ai_app/screens/home.dart';
import 'package:brota_ai_app/screens/join_event_screen.dart';
import 'package:brota_ai_app/screens/login.dart';
import 'package:brota_ai_app/screens/my_events_screen.dart';
import 'package:brota_ai_app/screens/my_splash_screen.dart';
import 'package:brota_ai_app/screens/new_event.dart';
import 'package:brota_ai_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'models/event_card_model.dart';

void main() {
  GetIt.I.registerSingleton<UsersModel>(UsersModel());
  GetIt.I.registerSingleton<EventResponseCardModel>(EventResponseCardModel());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return MaterialApp(
      title: 'Brota aí',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF198754),
        ),
      ),
      home: const MySplashScreen(),
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        NewEventScreen.id: (context) => const NewEventScreen(),
        MyEventsScreen.id: (context) => const MyEventsScreen(),
        JoinEventScreen.id: (context) => const JoinEventScreen(),
        EventList.id:(context) => const EventList(),
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
