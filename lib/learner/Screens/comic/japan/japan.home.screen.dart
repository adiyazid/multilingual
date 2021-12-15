import 'package:flutter/material.dart';
import 'package:learningapp/learner/Screens/comic/japan/japan.comic.screen.dart';
import 'package:learningapp/learner/utils/LearnerConstant.dart';
import 'package:learningapp/main/utils/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

abstract class JapanHomeScreen extends StatefulWidget {
  const JapanHomeScreen({Key? key}) : super(key: key);

  @override
  _JapanHomeScreenState createState() => _JapanHomeScreenState();
}

class _JapanHomeScreenState extends State<JapanHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final topView = Row(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: <Widget>[
    //     Expanded(
    //       child: Container(
    //         child: text("Al-Fatihah",
    //             fontFamily: fontBold,
    //             fontSize: textSizeNormal,
    //             textColor: learner_textColorPrimary),
    //       ),
    //     ),
    //   ],
    // );

    // Map data = {};
    // String lang;
    // data = data.isNotEmpty
    //     ? data
    //     : ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    // lang = data['lang'];

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFfaf5f5),
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Japanese",
              style: TextStyle(color: black, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(28),
            child: GridView(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JapanComicScreen()),);
                  },
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.amberAccent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset('images/ic_comic.png',
                              width: 200, height: 80),
                        ),
                        text(
                          "Comic",
                          fontFamily: fontBold,
                          fontSize: textSizeNormal,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/quiz');
                  },
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.greenAccent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset('images/ic_quiz.png',
                              width: 200, height: 80),
                        ),
                        text(
                          "Quiz",
                          fontFamily: fontBold,
                          fontSize: textSizeNormal,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2,
                  crossAxisCount: 2,
                  crossAxisSpacing: 50,
                  mainAxisSpacing: 200),
            ),
          )),
    );
  }
}
