import 'package:flutter/material.dart';
import 'package:learningapp/learner/model/learner_models.dart';
import 'package:learningapp/learner/utils/LearnerColors.dart';
import 'package:learningapp/learner/utils/LearnerConstant.dart';
import 'package:learningapp/learner/utils/learner_data_generator.dart';
import 'package:learningapp/learner/utils/learner_images.dart';
import 'package:learningapp/learner/utils/learner_strings.dart';
import 'package:learningapp/main/utils/app_widget.dart';

class LearnerFavourites extends StatefulWidget {
  @override
  _LearnerFavouritesState createState() => _LearnerFavouritesState();
}

class _LearnerFavouritesState extends State<LearnerFavourites> {
  late List<LearnerFeaturedModel> mListings1;

  @override
  void initState() {
    super.initState();
    mListings1 = learnerGetFavourites();
  }

  @override
  Widget build(BuildContext context) {
    final topView = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: text(learner_lbl_favourites,
                fontFamily: fontBold,
                fontSize: textSizeNormal,
                textColor: learner_textColorPrimary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(learner_ic_fab_back, width: 40, height: 40),
              const Icon(Icons.search, color: learner_colorPrimary)
            ],
          ),
        ),
      ],
    );

    final cardList = ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: mListings1.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: boxDecoration(
                showShadow: true, bgColor: learner_white, radius: 10.0),
            margin: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    child: Image.asset(
                      mListings1[index].img,
                      height: 50,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(mListings1[index].name,
                                      fontFamily: fontBold,
                                      textColor: learner_textColorPrimary),
                                  const SizedBox(height: 4),
                                  text(mListings1[index].type,
                                      textColor: learner_textColorPrimary),
                                ],
                              ),
                            ),
                            const Icon(Icons.favorite, color: Colors.red, size: 30),
                          ],
                        ),
                        const Divider(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text("20",
                                    fontFamily: fontBold,
                                    textColor: learner_textColorPrimary),
                                SizedBox(height: 4),
                                text("Students",
                                    textColor: learner_textColorSecondary),
                              ],
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text("51",
                                      fontFamily: fontBold,
                                      textColor: learner_textColorPrimary),
                                  SizedBox(height: 4),
                                  text("Lectures",
                                      textColor: learner_textColorSecondary),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: text(mListings1[index].price,
                                  textColor: learner_white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });

    return SafeArea(
      child: Scaffold(
        backgroundColor: learner_layout_background,
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 8),
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
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  topView,
                  cardList,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
