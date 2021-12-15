import 'dart:async';

import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Verify.screen.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1>
    with SingleTickerProviderStateMixin {
  final auth = FirebaseAuth.instance;
  late User user;

  //add splash screen
  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    if (mounted) {
      super.initState();
      startTime();
    }
  }

  void navigationPage() {
    user = auth.currentUser!;
    if (user.emailVerified) {
      Navigator.pushNamed(context, '/dashboard');
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VerifyScreen()));
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: DelayedDisplay(
        delay: const Duration(seconds: 2),
        child: Text(
          'Log in  to the web ...',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      )),
    );
  }
}
