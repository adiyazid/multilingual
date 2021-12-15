import 'package:flutter/material.dart';
import 'package:learningapp/learner/utils/LearnerColors.dart';
import 'package:learningapp/learner/utils/learner_images.dart';
import 'package:learningapp/learner/utils/learner_strings.dart';
import 'package:learningapp/learner/utils/learner_widget.dart';
import 'package:learningapp/main/utils/app_widget.dart';
import 'package:learningapp/Provider/user.provider.dart';
import 'package:learningapp/Widget/loading-indicator.widget.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

import 'learner_sign_up.dart';

class LearnerLogin extends StatefulWidget {
  static String tag = '/LearnerModrenMedicine';

  const LearnerLogin({Key? key}) : super(key: key);

  @override
  _LearnerLoginState createState() => _LearnerLoginState();
}

class _LearnerLoginState extends State<LearnerLogin> {
  String email = '';
  String password = '';
  bool loading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(learner_layout_background);

    return Scaffold(
      backgroundColor: learner_layout_background,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: learner_colorPrimary),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 800,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: learner_white, width: 4)),
                      child: CircleAvatar(
                          backgroundImage: const AssetImage(learner_ic_Profile),
                          radius: 50),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: learner_hint_email,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      obscureText: _isObscure,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: learner_hint_password,
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 120,
                        alignment: Alignment.center,
                        child: LearnerButton(
                          onPressed: () async {
                            try {
                              LoadingIndicator.showLoadingDialog(context);
                              await AppUser.instance.signIn(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              Navigator.pop(context);
                            } catch (e) {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(e.toString()),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Ok')),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          textContent: learner_lbl_enter,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    text(learner_lbl_don_t_joined_yet),
                    const SizedBox(width: 8),
                    text(learner_lbl_join, textColor: learner_colorPrimary)
                  ],
                ),
                onTap: () {
                  LearnerSignUp().launch(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
