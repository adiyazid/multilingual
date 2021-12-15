import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:learningapp/learner/Screens/others/LearnerInstructorsDetails.dart';
import 'package:learningapp/learner/model/LearnerModels.dart';
import 'package:learningapp/learner/utils/LearnerColors.dart';
import 'package:learningapp/learner/utils/LearnerConstant.dart';
import 'package:learningapp/learner/utils/learner_data_generator.dart';
import 'package:learningapp/learner/utils/learner_strings.dart';
import 'package:learningapp/main/utils/app_widget.dart';

class LearnerSearch extends StatefulWidget {
  const LearnerSearch({Key? key}) : super(key: key);

  @override
  _LearnerSearchState createState() => _LearnerSearchState();
}

class _LearnerSearchState extends State<LearnerSearch> {
  late List<LearnerCoursesModel> mList2;

  @override
  void initState() {
    super.initState();
    mList2 = learnerGetCourses();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(learner_layout_background);

    return Scaffold(
        backgroundColor: learner_layout_background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: boxDecoration(
                    showShadow: true, bgColor: learner_white, radius: 0),
                padding: const EdgeInsets.fromLTRB(12, 16, 16, 12),
                margin: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.search,
                              color: learner_colorPrimary, size: 20),
                        ),
                        Text(learner_hint_search,
                            style: TextStyle(
                                fontSize: textSizeMedium,
                                color: learner_textColorSecondary)),
                      ],
                    ),
                    Row(
                      children: const <Widget>[
                        Text(learner_lbl_filter,
                            style: TextStyle(
                                fontSize: textSizeMedium,
                                color: learner_colorPrimary)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.close,
                              color: learner_textColorSecondary, size: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: text(learner_lbl_recommended,
                    fontFamily: fontBold,
                    fontSize: textSizeLargeMedium,
                    textColor: learner_textColorPrimary),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mList2.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return LearnerRecommended(mList2[index], index);
                    }),
              ),
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class LearnerInstructor extends StatelessWidget {
  late LearnerPeopleModel model;

  LearnerInstructor(this.model, int pos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(model.img),
                radius: 70,
              ),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: model.isOnline
                        ? learner_green
                        : learner_greyColor.withOpacity(1.0),
                    shape: BoxShape.circle,
                    border: Border.all(color: learner_white, width: 1.5)),
              ).cornerRadiusWithClipRRect(7).paddingOnly(top: 4, right: 2)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          text(model.name, fontFamily: fontMedium),
          text(model.subject, textColor: learner_textColorSecondary),
        ],
      ),
    ).onTap(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LearnerInstructorsDetails()),
      );
    });
  }
}

// ignore: must_be_immutable
class LearnerRecommended extends StatelessWidget {
  late LearnerCoursesModel model;

  LearnerRecommended(this.model, int pos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 8),
      child: CircleAvatar(
        radius: 70,
        backgroundImage: AssetImage(model.img),
      ),
    );
  }
}
