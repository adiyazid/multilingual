import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learningapp/Provider/user.provider.dart';
import 'package:learningapp/Services/score.services.dart';
import 'package:learningapp/learner/Screens/al_fatihah/result_screen.dart';
import 'package:learningapp/learner/model/mc_question_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learningapp/learner/model/score_model.dart';
import 'package:nb_utils/nb_utils.dart';

class Quizzes extends StatefulWidget {
  const Quizzes({Key? key}) : super(key: key);

  @override
  _QuizzesState createState() => _QuizzesState();
}

class _QuizzesState extends State<Quizzes> {
  int highest = 0;
  Map data = {};
  Color mainColor = const Color(0xFF252c4a);
  Color secondcolor = Colors.blue;

  //PageController
  final PageController? _controller = PageController(initialPage: 0);

  //Variable for question
  bool isPressed = false;
  bool answerPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Colors.blue;
  int score = 0;
  int questionsCount = 0;
  String? selectedLang;

  late String option, answer;

  //retrieve quiz

  List<MCQuestionModel> mc_question = [];

  Future getQuiz() async {
    //  data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    // selectedLang = data['lang'];
    //print(selectedLang);

    //get MC questions
    QuerySnapshot mcQuerySnapshot = await FirebaseFirestore.instance
        .collection('quiz')
        .doc(selectedLang)
        .collection('CHAPTER1')
        .doc('MultipleChoice')
        .collection('ListOfQuestion')
        .get();

    for (int i = 0; i < mcQuerySnapshot.docs.length; i++) {
      answer = mcQuerySnapshot.docs[i].get('ANSWER').toString();
      mc_question.add(MCQuestionModel(
        question: mcQuerySnapshot.docs[i].get('QUESTION').toString(),
        option: {
          mcQuerySnapshot.docs[i].get('A').toString():
              (mcQuerySnapshot.docs[i].get('A').toString() == answer
                  ? true
                  : false),
          mcQuerySnapshot.docs[i].get('B').toString():
              (mcQuerySnapshot.docs[i].get('B').toString() == answer
                  ? true
                  : false),
          mcQuerySnapshot.docs[i].get('C').toString():
              (mcQuerySnapshot.docs[i].get('C').toString() == answer
                  ? true
                  : false),
          mcQuerySnapshot.docs[i].get('D').toString():
              (mcQuerySnapshot.docs[i].get('D').toString() == answer
                  ? true
                  : false),
        },
        answer: mcQuerySnapshot.docs[i].get('ANSWER').toString(),
      ));
    }

    //get T/F questions

    QuerySnapshot tfQuerySnapshot = await FirebaseFirestore.instance
        .collection('quiz')
        .doc('LANG1')
        .collection('CHAPTER1')
        .doc('TrueFalse')
        .collection('ListOfQuestion')
        .get();

    for (int i = 0; i < tfQuerySnapshot.docs.length; i++) {
      answer = tfQuerySnapshot.docs[i].get('answer').toString();
      mc_question.add(MCQuestionModel(
        question: tfQuerySnapshot.docs[i].get('question').toString(),
        option: {
          "True": ("true" == answer ? true : false),
          "False": ("false" == answer ? true : false)
        },
        answer: tfQuerySnapshot.docs[i].get('answer').toString(),
      ));
    }

    //print(tf_question[1].question.toString());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getQuiz();
    answerPressed = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: StreamBuilder<Score>(
          stream: highestScore,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Score? _score = snapshot.data;
              highest = _score!.score;
              print(highest);
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: PageView.builder(
                    controller: _controller!,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (page) {
                      setState(() {
                        isPressed = false;
                      });
                    },
                    itemCount: mc_question.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Question ${index + 1} /${mc_question.length}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28.0),
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 8.0,
                            thickness: 1.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                mc_question[index].question!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          //Creating Button Using Loooping
                          for (int i = 0;
                              i < mc_question[index].option!.length;
                              i++)
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 12.0),
                              child: MaterialButton(
                                color: isPressed
                                    ? mc_question[index]
                                            .option!
                                            .entries
                                            .toList()[i]
                                            .value
                                        ? isTrue
                                        : isWrong
                                    : secondcolor,
                                onPressed: isPressed
                                    ? () {}
                                    : () async {
                                        final prefs = await SharedPreferences
                                            .getInstance();

                                        final myScore =
                                            prefs.getInt('score') ?? 0;
                                        answerPressed = true;
                                        setState(() {
                                          isPressed = true;
                                          answerPressed = true;
                                        });
                                        if (mc_question[index]
                                            .option!
                                            .entries
                                            .toList()[i]
                                            .value) {
                                          score += 10;
                                          prefs.setInt('score', score);
                                        }
                                      },
                                shape: const StadiumBorder(),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18.0),
                                child: Text(
                                  mc_question[index].option!.keys.toList()[i],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () async {
                                  if (_controller!.page?.toInt() ==
                                      mc_question.length - 1) {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    final myScore = prefs.getInt('score') ?? 0;
                                    print(myScore);
                                    var now = DateTime.now();
                                    var formatter =
                                        DateFormat.yMMMMd().add_jm();
                                    String formattedDate =
                                        formatter.format(now);

                                    if (myScore > highest) {
                                      await addScoreStreak(Score(
                                        score: myScore,
                                        userName: AppUser().user!.displayName,
                                        date: formattedDate,
                                      ));
                                    }

                                    prefs.remove('score');
                                    finish(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ResultScreen(score)));
                                  } else {
                                    //check if no answer has been selected

                                    if (!isPressed) {
                                      //display a message
                                      Fluttertoast.showToast(
                                          msg:
                                              "Please select an answer to continue",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      return;
                                    }
                                    _controller!.nextPage(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.linear);

                                    setState(() {
                                      isPressed = false;
                                    });
                                  }
                                },
                                child: Text(
                                  index + 1 == mc_question.length
                                      ? "Check Result"
                                      : "Next Question",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: PageView.builder(
                    controller: _controller!,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (page) {
                      setState(() {
                        isPressed = false;
                      });
                    },
                    itemCount: mc_question.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Question ${index + 1} /${mc_question.length}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 28.0),
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 8.0,
                            thickness: 1.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                mc_question[index].question!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          //Creating Button Using Loooping
                          for (int i = 0;
                              i < mc_question[index].option!.length;
                              i++)
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 12.0),
                              child: MaterialButton(
                                color: isPressed
                                    ? mc_question[index]
                                            .option!
                                            .entries
                                            .toList()[i]
                                            .value
                                        ? isTrue
                                        : isWrong
                                    : secondcolor,
                                onPressed: isPressed
                                    ? () {}
                                    : () async {
                                        final prefs = await SharedPreferences
                                            .getInstance();

                                        final myScore =
                                            prefs.getInt('score') ?? 0;
                                        answerPressed = true;
                                        setState(() {
                                          isPressed = true;
                                          answerPressed = true;
                                        });
                                        if (mc_question[index]
                                            .option!
                                            .entries
                                            .toList()[i]
                                            .value) {
                                          score += 10;
                                          prefs.setInt('score', score);
                                        }
                                      },
                                shape: const StadiumBorder(),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18.0),
                                child: Text(
                                  mc_question[index].option!.keys.toList()[i],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () async {
                                  if (_controller!.page?.toInt() ==
                                      mc_question.length - 1) {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    final myScore = prefs.getInt('score') ?? 0;
                                    print(myScore);
                                    var now = DateTime.now();
                                    var formatter =
                                        DateFormat.yMMMMd().add_jm();
                                    String formattedDate =
                                        formatter.format(now);

                                    if (myScore > highest) {
                                      await addScoreStreak(Score(
                                        score: myScore,
                                        userName: AppUser().user!.displayName,
                                        date: formattedDate,
                                      ));
                                    }

                                    prefs.remove('score');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ResultScreen(score)));
                                  } else {
                                    //check if no answer has been selected

                                    if (!isPressed) {
                                      //display a message
                                      Fluttertoast.showToast(
                                          msg:
                                              "Please select an answer to continue",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      return;
                                    }
                                    _controller!.nextPage(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.linear);

                                    setState(() {
                                      isPressed = false;
                                    });
                                  }
                                },
                                child: Text(
                                  index + 1 == mc_question.length
                                      ? "Check Result"
                                      : "Next Question",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              );
            }
          }),
    );
  }
}
