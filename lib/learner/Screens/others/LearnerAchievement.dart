import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:learningapp/learner/model/LearnerModels.dart';
import 'package:learningapp/learner/utils/LearnerColors.dart';
import 'package:learningapp/learner/utils/LearnerConstant.dart';
import 'package:learningapp/learner/utils/learner_data_generator.dart';
import 'package:learningapp/learner/utils/learner_strings.dart';
import 'package:learningapp/main/utils/app_widget.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen>{
  late List<LearnerPeopleModel> mList1;
  late List<LearnerPeopleModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetParticipants();
    mList2 = learnerGetParticipants();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learner_layout_background,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: learner_layout_background,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(170),
              child: Container(
                color: Colors.white,
                child: SafeArea(
                  child: Container(
                    color: learner_layout_background,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back, color: learner_colorPrimary),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        Center(
                            child: text(lbl_leaderboard,
                                fontSize: textSizeLarge,
                                fontFamily: fontBold,
                                textColor: learner_textColorPrimary)),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TabBar(
                            labelPadding: EdgeInsets.only(left: 20.0, right: 0),
                            indicatorWeight: 4.0,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: learner_colorPrimary,
                            labelColor: learner_colorPrimary,
                            isScrollable: true,
                            unselectedLabelColor: learner_textColorSecondary,
                            tabs: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(lbl_daily_leaderboard, style: TextStyle(fontSize: 18.0, fontFamily: fontBold)),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(lbl_weekly_leaderboard, style: TextStyle(fontSize: 18.0, fontFamily: fontBold)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ).paddingOnly(left: 12, right: 16),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList1.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return DailyLeaderboard(mList1[index], index);
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList2.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return WeeklyLeaderboard(mList2[index], index);
                  },
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
class DailyLeaderboard extends StatelessWidget {
  late LearnerPeopleModel model; //using template model for the list of participants

  DailyLeaderboard(LearnerPeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var i = 0;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Row(
              children: <Widget>[
                CircleAvatar(backgroundImage: CachedNetworkImageProvider(model.img), radius: MediaQuery.of(context).size.width * 0.08),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text(model.name, fontFamily: fontMedium, textColor: learner_textColorPrimary),
                    SizedBox(width: 4),
                    text(model.points, textColor: learner_textColorSecondary),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 35,
            height: 35,
            decoration: BoxDecoration(shape: BoxShape.circle, color: whiteColor, border: Border.all(color: learner_view_color, width: 0.5)),
            child: Center(child: text((i + 1).toString())),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class WeeklyLeaderboard extends StatelessWidget {
  late LearnerPeopleModel model;

  WeeklyLeaderboard(LearnerPeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var i = 0;
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(backgroundImage: CachedNetworkImageProvider(model.img), radius: MediaQuery.of(context).size.width * 0.08),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text(model.name, fontFamily: fontMedium, textColor: learner_textColorPrimary),
                    SizedBox(width: 4),
                    text(model.points, textColor: learner_textColorSecondary),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 35,
              height: 35,
              decoration: BoxDecoration(shape: BoxShape.circle, color: whiteColor, border: Border.all(color: learner_view_color, width: 0.5)),
              child: Center(child: text((i + 1).toString())),
            )
          ],
        ),
      ),
    );
  }
}
