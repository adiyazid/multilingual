import 'dart:async';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>
    with SingleTickerProviderStateMixin {
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
    Navigator.pushNamed(context, '/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: DelayedDisplay(
            delay: const Duration(seconds: 2),
            child: Text(
              'Welcome ...',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          )),
    );
  }
}
