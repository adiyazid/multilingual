import 'package:flutter/material.dart';
import 'package:learningapp/learner/model/LearnerModels.dart';
import 'package:learningapp/learner/utils/LearnerColors.dart';
import 'package:learningapp/learner/utils/LearnerConstant.dart';
import 'package:learningapp/learner/utils/learner_data_generator.dart';
import 'package:learningapp/learner/utils/learner_strings.dart';
import 'package:learningapp/main/utils/app_widget.dart';

class LearnerHome extends StatefulWidget {
  const LearnerHome({Key? key}) : super(key: key);

  @override
  _LearnerHomeState createState() => _LearnerHomeState();
}

class _LearnerHomeState extends State<LearnerHome> {
  late List<LearnerFeaturedModel> mList1;
  late List<LearnerCategoryModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetFavourites();
    mList2 = learnerGetCategories();

    changeStatusColor(learner_layout_background);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text(learner_lbl_featured,
                    fontFamily: fontBold, fontSize: textSizeNormal),
                text(
                  learner_lbl_see_all,
                  textColor: learner_colorPrimary,
                  textAllCaps: true,
                  fontFamily: fontMedium,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 400,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: mList1.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(right: 16),
              itemBuilder: (context, index) {
                return LearnerFeatured(mList1[index], index);
              },
            ),
          ),
          const SizedBox(height: 20),
          Container(
              margin: const EdgeInsets.only(left: 16),
              child: text(learner_lbl_categories,
                  fontFamily: fontBold, fontSize: textSizeNormal)),
          const SizedBox(height: 20),
          GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: mList2.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return LearnerCategory(mList2[index], index);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2,
              mainAxisExtent: 210,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerFeatured extends StatelessWidget {
  late LearnerFeaturedModel model;

  LearnerFeatured(this.model, int pos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(left: 16),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                model.img,
                fit: BoxFit.cover,
                height: 300,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  text(model.name,
                      fontFamily: fontMedium, isLongText: false, maxLine: 2),
                  text(model.price, textColor: learner_textColorSecondary),
                ],
              ),
            )
          ],
        ),
        onTap: () => Navigator.pushNamed(context, model.path),
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerCategory extends StatelessWidget {
  late LearnerCategoryModel model;

  LearnerCategory(this.model, int pos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Container(
                decoration: boxDecoration(bgColor: learner_white, radius: 12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        model.img,
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: text(model.name)),
            ],
          ),
        ),
      ],
    );
  }
}
