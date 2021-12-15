import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/Provider/user.provider.dart';
import 'Provider/user.provider.dart';
import 'Widget/src/pouring_hour_glass_refined.dart';
import 'learner/Screens/others/learner_dashboard.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    if (mounted) {
      super.initState();
      user = auth.currentUser!;
      user.sendEmailVerification();
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        //check if email is verified
        checkEmailVerified();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpinKitPouringHourGlassRefined(
                color: Colors.purple,
                size: 50.0,
              ),
              const SizedBox(height: 50),
              Text('An email has been sent to ${user.email}. Please verify',
                  style: TextStyle(
                    color: Colors.purple[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 25),
              ElevatedButton(
                  onPressed: () async {
                    await AppUser.instance.signOut();
                  },
                  child: const Text('Back'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      //navigate to home page
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LearnerDashboard()));
    }
  }
}
