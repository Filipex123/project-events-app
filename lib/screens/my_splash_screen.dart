import 'package:brota_ai_app/screens/home.dart';
import 'package:brota_ai_app/screens/login.dart';
import 'package:brota_ai_app/services/api_service.dart';
import 'package:brota_ai_app/services/token_storage_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MySplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    _verifyLoggedUser();
    super.initState();
  }

  void _redirectToLogin() {
    Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

  Future _verifyLoggedUser() async {
    APIService apiService = APIService();
    String? token = await TokenStorageService.read();

    if (token == null) {
      Timer(const Duration(seconds: 3), _redirectToLogin);
    } else {
      apiService.validToken(token).then((response) {
        apiService.getLogged();
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      }).catchError((error) async {
        TokenStorageService.clear();
        _redirectToLogin();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF198754),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/images/logo-pin.png",
                width: 120,
                height: 120,
              ),
            ),
            const Text(
              'Brota ai',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontFamily: 'ABeeZee',
                  fontWeight: FontWeight.w500,
                  fontSize: 60,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
