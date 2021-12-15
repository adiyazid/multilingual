import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/Provider/user.provider.dart';
import 'package:learningapp/Widget/loading-indicator.widget.dart';
import 'package:learningapp/learner/utils/LearnerColors.dart';
import 'package:learningapp/learner/utils/learner_images.dart';
import 'package:learningapp/learner/utils/learner_strings.dart';
import 'package:learningapp/learner/utils/learner_widget.dart';
import 'package:learningapp/main/utils/app_widget.dart';

class LearnerSignUp extends StatefulWidget {
  const LearnerSignUp({Key? key}) : super(key: key);

  @override
  _LearnerSignUpState createState() => _LearnerSignUpState();
}

class _LearnerSignUpState extends State<LearnerSignUp> {
  String error = '';
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    changeStatusColor(learner_layout_background);

    return Scaffold(
      backgroundColor: learner_layout_background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: 800,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: learner_white, width: 4)),
                        child: CircleAvatar(
                            backgroundImage:
                                CachedNetworkImageProvider(learner_ic_Profile),
                            radius: 50),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: learner_hint_full_name,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
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
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: learner_hint_password,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),SizedBox(
                        height: 16,
                      ),
                      TextField(
                        obscureText: true,
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: learner_hint_password,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 120,
                        alignment: Alignment.center,
                        child: LearnerButton(
                          onPressed: () async {
                            if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              setState(() {
                                error = 'Password did not match. Please insert again';
                              });
                            } else {
                              try {
                                LoadingIndicator.showLoadingDialog(context);
                                await AppUser.instance.signUp(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  name: _nameController.text,
                                );
                              } catch (e) {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(e.toString()),
                                    );
                                  },
                                );
                              }
                            }
                          },
                          textContent: learner_lbl_join,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
