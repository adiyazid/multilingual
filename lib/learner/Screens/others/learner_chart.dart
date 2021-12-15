import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:learningapp/learner/model/learner_models.dart';
import 'package:learningapp/learner/utils/LearnerColors.dart';
import 'package:learningapp/learner/utils/LearnerConstant.dart';
import 'package:learningapp/learner/utils/learner_data_generator.dart';
import 'package:learningapp/learner/utils/learner_strings.dart';
import 'package:learningapp/main/utils/app_widget.dart';

import 'LearnerDescription.dart';
import 'LearnerModrenMedicine.dart';

class LearnerChart extends StatefulWidget {
  @override
  _LearnerChartState createState() => _LearnerChartState();
}

class _LearnerChartState extends State<LearnerChart> {
  late List<LearnerCoursesModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learner_layout_background,
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: learner_layout_background,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(135),
              child: Container(
                child: SafeArea(
                  child: Container(
                    color: learner_layout_background,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                        ),
                        text(learner_lbl_My_Courses,
                                fontSize: textSizeXXLarge,
                                fontFamily: fontBold,
                                textColor: learner_textColorPrimary)
                            .paddingOnly(left: 16),
                        const SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TabBar(
                            labelPadding:
                                const EdgeInsets.only(left: 0, right: 0),
                            indicatorWeight: 4.0,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: learner_colorPrimary,
                            labelColor: learner_colorPrimary,
                            isScrollable: true,
                            unselectedLabelColor: learner_textColorSecondary,
                            tabs: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  learner_lbl_All,
                                  style: TextStyle(
                                      fontSize: 18.0, fontFamily: fontBold),
                                ),
                              ).paddingOnly(left: 8, right: 8),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  learner_lbl_Ongoing,
                                  style: TextStyle(
                                      fontSize: 18.0, fontFamily: fontBold),
                                ),
                              ).paddingOnly(right: 8),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  learner_lbl_Completed,
                                  style: TextStyle(
                                      fontSize: 18.0, fontFamily: fontBold),
                                ),
                              ).paddingOnly(right: 8)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).paddingOnly(left: 8, right: 16),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList1.length,
                  padding: const EdgeInsets.only(bottom: 50),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return LearnerCourses(
                        mList1[index], index, LearnerDescription.tag);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      mainAxisExtent: 310),
                ),
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList1.length,
                  padding: const EdgeInsets.only(bottom: 50),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return LearnerCourses(
                        mList1[index], index, LearnerModrenMedicine.tag);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      mainAxisExtent: 310),
                ),
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList1.length,
                  padding: const EdgeInsets.only(bottom: 50),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return LearnerCourses(
                        mList1[index], index, LearnerDescription.tag);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      mainAxisExtent: 310),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerCourses extends StatelessWidget {
  late LearnerCoursesModel model;
  late String tags;

  LearnerCourses(this.model, int pos, this.tags, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchNewScreen(context, tags);
      },
      child: Container(
        alignment: Alignment.center,
        color: learner_white,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  model.img,
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ).cornerRadiusWithClipRRect(25).paddingOnly(left: 16, top: 16),
                IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: learner_greyColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Column(
              children: <Widget>[
                text(model.name,
                        textColor: learner_textColorPrimary,
                        fontSize: textSizeMedium,
                        fontFamily: fontMedium,
                        maxLine: 2)
                    .paddingOnly(left: 16, right: 16, top: 16),
                Container(
                  child: LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: textSecondaryColor.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      learner_green,
                    ),
                  ).paddingOnly(top: 16, left: 16, right: 16),
                )
              ],
            )
          ],
        ),
      )
          .cornerRadiusWithClipRRect(10.0)
          .paddingOnly(top: 16, left: 16, right: 16),
    );
  }
}
