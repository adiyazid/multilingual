import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class EngComicScreen extends StatefulWidget {
  const EngComicScreen({Key? key}) : super(key: key);

  @override
  _EngComicScreenState createState() => _EngComicScreenState();
}

class _EngComicScreenState extends State<EngComicScreen> {
  int pageChanged = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfaf5f5),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Let's Learn Arabic",
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() => pageChanged = value);
              },
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              height: 430,
                              //color: Colors.greenAccent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                        margin: const EdgeInsets.only(top: 8.0),
                                        width: 360,
                                        height: 480,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/comic/arabic/1_arabic.png'),
                                                fit: BoxFit.fill))),
                                  ),
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Center(
                              child: Container(
                                height: 430,
                                //color: Colors.greenAccent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(top: 8.0),
                                        width: 360,
                                        height: 480,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/comic/eng/1_eng.png'),
                                                fit: BoxFit.fill))),
                                  ],
                                ),
                              ),
                            )),
                            const SizedBox(
                              width: 8.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ), //scene 1
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              height: 430,
                              //color: Colors.greenAccent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                        margin: const EdgeInsets.only(top: 8.0),
                                        width: 360,
                                        height: 480,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/comic/arabic/2_arabic.png'),
                                                fit: BoxFit.fill))),
                                  ),
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              height: 430,
                              //color: Colors.greenAccent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                        margin: const EdgeInsets.only(top: 8.0),
                                        width: 360,
                                        height: 480,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/comic/eng/2_eng.png'),
                                                fit: BoxFit.fill))),
                                  ),
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ), //scene 2
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              height: 430,
                              //color: Colors.greenAccent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                        margin: const EdgeInsets.only(top: 8.0),
                                        width: 360,
                                        height: 480,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/comic/arabic/3_arabic.png'),
                                                fit: BoxFit.fill))),
                                  ),
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              height: 430,
                              //color: Colors.greenAccent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                        margin: const EdgeInsets.only(top: 8.0),
                                        width: 360,
                                        height: 480,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/comic/eng/3_eng.png'),
                                                fit: BoxFit.fill))),
                                  ),
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ), //scene 3
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              height: 430,
                              //color: Colors.greenAccent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                        margin: const EdgeInsets.only(top: 8.0),
                                        width: 360,
                                        height: 480,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/comic/arabic/4_arabic.png'),
                                                fit: BoxFit.fill))),
                                  ),
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              height: 430,
                              //color: Colors.greenAccent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                        margin: const EdgeInsets.only(top: 8.0),
                                        width: 360,
                                        height: 480,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/comic/eng/4_eng.png'),
                                                fit: BoxFit.fill))),
                                  ),
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ), //scene 4
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (pageChanged != 0)
                    GestureDetector(
                      onTap: () {
                        pageChanged = pageChanged - 1;

                        pageController.animateToPage(pageChanged,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.arrow_back_ios_outlined, size: 35),
                          Text('Back', style: TextStyle(fontSize: 30)),
                        ],
                      ),
                    ),
                  const Spacer(),
                  if (pageChanged != 4)
                    GestureDetector(
                      onTap: () {
                        pageChanged = pageChanged + 1;
                        if (pageChanged >= 4) {
                          pageChanged = pageChanged - 1;
                        } else {
                          pageController.animateToPage(pageChanged,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linearToEaseOut);
                        }
                      },
                      child: Row(
                        children: const [
                          Text('Next', style: TextStyle(fontSize: 30)),
                          Icon(Icons.arrow_forward_ios_outlined, size: 35),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
