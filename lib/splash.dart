import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Verify.screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = FirebaseAuth.instance;
  late User user;

  _startNextScreen() {
    user = auth.currentUser!;
    if (user.emailVerified) {
      Navigator.pushNamed(context, '/dashboard');
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VerifyScreen()));
    }
  }

  var windowWidth;
  var windowHeight;

  @override
  void initState() {
    super.initState();
    print("load splash");
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, _startNextScreen);
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: const [Color(0xFF000000), Color(0xFF0d015b)],
          ),
        )),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Image.asset("assets/applogo.png", fit: BoxFit.cover),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
