import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learningapp/learner/Screens/others/learner_login.dart';
import 'package:learningapp/learner/Screens/others/learner_profile.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: 'Name successfully changes',
      ),
    );
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LearnerProfile()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: SpinKitChasingDots(
          color: Colors.blueAccent,
          size: 80.0,
        ),
      ),
    );
  }
}

class Loading2 extends StatefulWidget {
  const Loading2({Key? key}) : super(key: key);

  @override
  State<Loading2> createState() => _Loading2State();
}

class _Loading2State extends State<Loading2> {
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
    showTopSnackBar(
      context,
      CustomSnackBar.info(
        message: 'Logout Successfully',
      ),
    );
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LearnerLogin()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: SpinKitChasingDots(
          color: Colors.blueAccent,
          size: 80.0,
        ),
      ),
    );
  }
}
