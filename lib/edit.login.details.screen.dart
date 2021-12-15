import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/Landing.page.dart';
import 'package:learningapp/Provider/user.provider.dart';
import 'package:learningapp/learner/utils/LearnerColors.dart';
import 'package:learningapp/learner/utils/LearnerConstant.dart';
import 'package:learningapp/learner/utils/learner_strings.dart';
import 'package:learningapp/learner/utils/learner_widget.dart';
import 'package:learningapp/main/utils/app_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class EditLoginDetailsScreen extends StatefulWidget {
  const EditLoginDetailsScreen({Key? key}) : super(key: key);

  @override
  _EditLoginDetailsScreenState createState() => _EditLoginDetailsScreenState();
}

class _EditLoginDetailsScreenState extends State<EditLoginDetailsScreen> {
  String? _pass;
  String? _pass2;
  String? _pass3;
  String? _name;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser>(context);
    var name = appUser.user!.displayName;
    var email = appUser.user!.email;
    return Scaffold(
      backgroundColor: learner_layout_background,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Update Profile",
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SafeArea(
              child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
          )),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: 700,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 50,
                      ),

                      text(lbl_FullName,
                          fontSize: textSizeMedium,
                          fontFamily: fontBold,
                          textColor: learner_textColorPrimary),
                      TextFormField(
                        onChanged: (e) {
                          setState(() {
                            _name = e;
                          });
                        },
                        style: TextStyle(
                            fontSize: textSizeMedium, fontFamily: fontRegular),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
                          hintText: name!,
                          filled: true,
                          fillColor: learner_white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                color: learner_white, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                color: learner_white, width: 0.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 220,
                        alignment: Alignment.center,
                        child: LearnerButton(
                          onPressed: () async {
                            if (_name != null) {
                              appUser.updateName(_name!);
                              LoadingPage().launch(context);
                            } else {
                              showTopSnackBar(
                                context,
                                CustomSnackBar.error(
                                  message: 'Error!! Please fill all fields',
                                ),
                              );
                            }
                          },
                          textContent: 'Change Name',
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      text('Current Password',
                          fontSize: textSizeMedium,
                          fontFamily: fontMedium,
                          textColor: learner_textColorPrimary),
                      TextFormField(
                        obscureText: _isObscure,
                        onChanged: (e) {
                          setState(() {
                            _pass3 = e;
                          });
                        },
                        style: TextStyle(
                            fontSize: textSizeMedium, fontFamily: fontRegular),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
                          hintText: 'Insert current password',
                          filled: true,
                          fillColor: learner_white,
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                color: learner_white, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                color: learner_white, width: 0.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      text(lbl_NewPassword,
                          fontSize: textSizeMedium,
                          fontFamily: fontMedium,
                          textColor: learner_textColorPrimary),
                      TextFormField(
                        obscureText: _isObscure,
                        onChanged: (e) {
                          setState(() {
                            _pass = e;
                          });
                        },
                        style: TextStyle(
                            fontSize: textSizeMedium, fontFamily: fontRegular),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
                          hintText: 'Insert new password',
                          filled: true,
                          fillColor: learner_white,
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                color: learner_white, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                color: learner_white, width: 0.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      text('Re-enter New Password',
                          fontSize: textSizeMedium,
                          fontFamily: fontMedium,
                          textColor: learner_textColorPrimary),
                      TextFormField(
                        obscureText: _isObscure,
                        onChanged: (e) {
                          setState(() {
                            _pass2 = e;
                          });
                        },
                        style: TextStyle(
                            fontSize: textSizeMedium, fontFamily: fontRegular),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
                          hintText: 'Re-enter new password',
                          filled: true,
                          fillColor: learner_white,
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                color: learner_white, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                color: learner_white, width: 0.0),
                          ),
                        ),
                      ),
                      // LearnerEditTextStyle(lbl_NewPassword, isPassword: true),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 220,
                        alignment: Alignment.center,
                        child: LearnerButton(
                          onPressed: () async {
                            if (_pass != null && _pass == _pass2) {
                              appUser.updatePassword(_pass!);
                              appUser.signIn(email: email!, password: _pass3!);
                              showTopSnackBar(
                                context,
                                CustomSnackBar.success(
                                  message: 'Password successfully changes',
                                ),
                              );
                            } else {
                              showTopSnackBar(
                                context,
                                CustomSnackBar.error(
                                  message:
                                      'Error!! Please ensure password are match',
                                ),
                              );
                            }
                          },
                          textContent: 'Change Password',
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
