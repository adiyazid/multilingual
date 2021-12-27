import 'package:flutter/material.dart';


import 'package:learningapp/learner/Screens/others/learner_home.dart';
import 'package:learningapp/learner/Screens/others/learner_profile.dart';
import 'package:learningapp/learner/Screens/others/learner_search.dart';
import 'package:learningapp/learner/utils/learner_bottom_navigation_bar.dart';
import 'package:learningapp/learner/utils/LearnerColors.dart';
import 'package:learningapp/learner/utils/learner_images.dart';
import 'package:learningapp/main/utils/app_widget.dart';

import 'learner_chart.dart';

class LearnerDashboard extends StatefulWidget {
  static String tag = '/LearnerDashboard';

  @override
  _LearnerDashboardState createState() => _LearnerDashboardState();
}

class _LearnerDashboardState extends State<LearnerDashboard> {
  var selectedIndex = 0;
  var pages = [
    LearnerHome(),
    LearnerChart(),
    LearnerProfile(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
      if (selectedIndex == 0) {
        print("Home");
      } else if (selectedIndex == 1) {
        print("Chart");
      } else if (selectedIndex == 2) {
        print("Profile");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(learner_layout_background);

    return Scaffold(
      backgroundColor: learner_layout_background,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: learner_ShadowColor,
              offset: Offset.fromDirection(3, 1),
              spreadRadius: 1,
              blurRadius: 5)
        ]),
        child: LearnerBottomNavigationBar(
          items: const <LearnerBottomNavigationBarItem>[
            LearnerBottomNavigationBarItem(icon: Learner_ic_home_navigation),
            LearnerBottomNavigationBarItem(icon: Learner_ic_chart_navigation),
            LearnerBottomNavigationBarItem(icon: Learner_ic_more_navigation),
          ],
          currentIndex: selectedIndex,
          unselectedIconTheme:
              const IconThemeData(color: learner_textColorSecondary, size: 24),
          selectedIconTheme:
              const IconThemeData(color: learner_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: LearnerBottomNavigationBarType.fixed,
        ),
      ),
      body: SafeArea(
        child: pages[selectedIndex],
      ),
    );
  }
}
