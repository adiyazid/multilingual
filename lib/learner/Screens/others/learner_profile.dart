import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learningapp/Landing.page.dart';
import 'package:learningapp/Provider/user.provider.dart';
import 'package:learningapp/learner/Screens/others/learner_favourites.dart';
import 'package:learningapp/learner/utils/LearnerColors.dart';
import 'package:learningapp/learner/utils/LearnerConstant.dart';
import 'package:learningapp/learner/utils/learner_images.dart';
import 'package:learningapp/learner/utils/learner_strings.dart';
import 'package:learningapp/main/utils/app_widget.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'package:learningapp/leaderboard.screen.dart';
import 'package:learningapp/edit.login.details.screen.dart';
import 'package:permission_handler/permission_handler.dart';

class LearnerProfile extends StatefulWidget {
  const LearnerProfile({Key? key}) : super(key: key);

  @override
  _LearnerProfileState createState() => _LearnerProfileState();
}

class _LearnerProfileState extends State<LearnerProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppUser();
  }

  File _file = File("zz");
  Uint8List webImage = Uint8List(10);

  uploadImage() async {
    var permissionStatus = requestPermissions();

    // MOBILE
    if (!kIsWeb && await permissionStatus.isGranted) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selected = File(image.path);

        setState(() {
          _file = selected;
        });
      } else {
        showToast("No file selected");
      }
    }
    // WEB
    else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          _file = File("a");
          webImage = f;
        });
      } else {
        showToast("No file selected");
      }
    } else {
      showToast("Permission not granted");
    }
  }

  Future<PermissionStatus> requestPermissions() async {
    await Permission.photos.request();
    return Permission.photos.status;
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // PickedFile? imageFile = null;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(learner_layout_background);
    return Scaffold(
      backgroundColor: learner_layout_background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: [
                        CircleAvatar(
                          //backgroundImage: const AssetImage(learner_ic_Profile),
                          radius: 55,
                          backgroundColor: Colors.yellow,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: (_file.path == "zz")
                                ? Image.asset("images/ic_profile.png",
                                width: 100, height: 100, fit: BoxFit.cover)
                                : (kIsWeb)
                                ? Image.memory(
                              webImage,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                                : Image.file(
                              _file,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => uploadImage(),
                          child: Text("Upload"),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(AppUser.instance.user!.displayName,
                            fontFamily: fontSemibold,
                            fontSize: textSizeLargeMedium,
                            textColor: learner_textColorPrimary),
                        text(learner_lbl_390_290_points,
                            textColor: learner_textColorPrimary),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            learnerAward(
                                learner_ic_medal, learner_colorPrimary),
                            learnerAward(learner_ic_crown, learner_green),
                            learnerAward(learner_ic_cup, learner_light_pink),
                            learnerAward(learner_ic_flag, learner_orange_dark),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 30, left: 16),
                  child: text(learner_lbl_general,
                      fontFamily: fontBold,
                      textAllCaps: true,
                      textColor: learner_textColorPrimary)),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: boxDecoration(
                    bgColor: learner_white, showShadow: true, radius: 0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: learnerOption(
                        learner_ic_heart,
                        learner_lbl_favourite_courses,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LearnerFavourites()),
                        );
                      },
                    ),
                    /* InkWell(
                    //   child: learnerOption(
                    //       learner_ic_user, learner_lbl_my_friends),
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => LearnerMyFriends()),
                    //     );
                    //   },
                    // ),*/
                    InkWell(
                      child: learnerOption(
                          learner_ic_achievements, lbl_leaderboard),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LeaderboardScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 25, left: 16),
                  child: text(learner_lbl_settings,
                      fontFamily: fontBold,
                      textAllCaps: true,
                      textColor: learner_textColorPrimary)),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: boxDecoration(
                    bgColor: learner_white, showShadow: true, radius: 0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: learnerOption(
                          learner_ic_key, learner_lbl_edit_login_details),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditLoginDetailsScreen()),
                        );
                      },
                    ),
                    learnerOption(
                        learner_ic_correct, learner_lbl_update_interests),
                    // learnerOption(learner_ic_block, learner_lbl_blocked_users),
                    InkWell(
                      child: learnerOption(learner_ic_logout, 'Logout'),
                      onTap: () async {
                        await AppUser.instance.signOut();
                        LoadingPage().launch(context);
                        // Navigator.pushNamed(context, '/login');
                        print("logout");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* void _showPicker(context) {
     showModalBottomSheet(
         context: context,
         builder: (BuildContext bc) {
          return SafeArea(
             child: Container(
               child: Wrap(
                children: <Widget>[
                   ListTile(
                       leading: Icon(Icons.photo_library),
                       title: Text('Photo Library'),
                       onTap: () {
                         _openGallery(context);
                         Navigator.of(context).pop();
                       }),
                   ListTile(
                     leading: Icon(Icons.photo_camera),
                     title: Text('Camera'),
                     onTap: () {
                       _openCamera(context);
                       Navigator.of(context).pop();
                     },
                   ),
                 ],
               ),
             ),
           );
         });
   }

   */
  Widget learnerAward(var icon, var bgColor) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 35,
      height: 35,
      decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          icon,
        ),
      ),
    );
  }

  Widget learnerOption(var icon, var heading) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: boxDecoration(
                    bgColor: learner_white, radius: 8, showShadow: true),
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  icon,
                  height: 40,
                  width: 40,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              text(heading,
                  textColor: learner_textColorPrimary,
                  fontSize: textSizeLargeMedium,
                  fontFamily: fontSemibold),
            ],
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: learner_textColorSecondary,
          ),
        ],
      ),
    );
  }
}

/* pick from gallery
 void _openGallery(BuildContext context) async {
  final pickedFile = await ImagePicker().pickImage(
    source: ImageSource.gallery,
   );
   setState(() {
     imageFile = pickedFile! as PickedFile?;
   });

   Navigator.pop(context);
    }
 */

/* pick from camera
 void _openCamera(BuildContext context) async {
   final pickedFile = await ImagePicker().pickImage(
     source: ImageSource.camera,
   );
   setState(() {
     imageFile = pickedFile! as PickedFile?;
   });
   Navigator.pop(context);
 }
}
 */
