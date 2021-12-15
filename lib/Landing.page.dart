import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/Widget/loading.dart';
import 'package:learningapp/splash.dart';
import 'package:provider/provider.dart';
import 'package:learningapp/Provider/user.provider.dart';
import 'package:learningapp/Splash.screen2.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser>(context);

    if (appUser.user != null) {
      print('Logged in');
      return SplashScreen();
    } else {
      print('Not logged in');
      return SplashScreen2();
    }
  }
}
class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser>(context);

    if (appUser.user != null) {
      print('Logged in');
      return Loading();
    } else {
      print('Not logged in');
      return Loading2();
    }
  }
}