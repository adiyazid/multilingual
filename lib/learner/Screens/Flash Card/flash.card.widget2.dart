library flash_card;

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

/// UI flash card, commonly found in language teaching to children
class FlashCardScreen2 extends StatefulWidget {
  /// constructor: Default height 200dp, width 200dp, duration  500 milliseconds
  const FlashCardScreen2(
      {required this.title,
      Key? key,
      this.duration = const Duration(milliseconds: 500),
      this.height = 200,
      this.width = 200})
      : super(key: key);

  final String title;

  /// flip time
  final Duration duration;

  /// height of card
  final double height;

  /// width of card
  final double width;

  @override
  _FlashCardScreen2State createState() => _FlashCardScreen2State();
}

class _FlashCardScreen2State extends State<FlashCardScreen2>
    with SingleTickerProviderStateMixin {
  /// controller flip animation
  late AnimationController _controller;

  /// animation for flip from front to back
  late Animation<double> _frontAnimation;

  ///animation for flip from back  to front
  late Animation<double> _backAnimation;

  /// state of card is front or back
  bool isFrontVisible = true;
  Artboard? artboard;
  RiveAnimationController? controller1,
      controller2,
      controller3,
      controller4,
      controller5,
      controller6,
      controller7,
      controller8,
      controller9,
      controller10,
      controller11,
      controller12,
      controller13,
      controller14;

  late final artboard1,
      artboard2,
      artboard3,
      artboard4,
      artboard5,
      artboard6,
      artboard7,
      artboard8,
      artboard9,
      artboard10,
      artboard11,
      artboard12,
      artboard13,
      artboard14;

  @override
  void initState() {
    super.initState();
    rootBundle.load("fruits/Papaya.riv").then((data) {
      final file = RiveFile.import(data);
      artboard1 = file.mainArtboard;
      artboard1.addController(controller1 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Pear.riv").then((data) {
      final file = RiveFile.import(data);
      artboard2 = file.mainArtboard;
      artboard2.addController(controller2 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Grape.riv").then((data) {
      final file = RiveFile.import(data);
      artboard3 = file.mainArtboard;
      artboard3.addController(controller3 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Durian.riv").then((data) {
      final file = RiveFile.import(data);
      artboard4 = file.mainArtboard;
      artboard4.addController(controller4 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Mango.riv").then((data) {
      final file = RiveFile.import(data);
      artboard5 = file.mainArtboard;
      artboard5.addController(controller5 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Pineapple.riv").then((data) {
      final file = RiveFile.import(data);
      artboard6 = file.mainArtboard;
      artboard6.addController(controller6 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Apple.riv").then((data) {
      final file = RiveFile.import(data);
      artboard7 = file.mainArtboard;
      artboard7.addController(controller7 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Orange.riv").then((data) {
      final file = RiveFile.import(data);
      artboard8 = file.mainArtboard;
      artboard8.addController(controller8 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Banana.riv").then((data) {
      final file = RiveFile.import(data);
      artboard9 = file.mainArtboard;
      artboard9.addController(controller9 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Strawberry.riv").then((data) {
      final file = RiveFile.import(data);
      artboard10 = file.mainArtboard;
      artboard10.addController(controller10 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Watermelon.riv").then((data) {
      final file = RiveFile.import(data);
      artboard11 = file.mainArtboard;
      artboard11.addController(controller11 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Watermelon.riv").then((data) {
      final file = RiveFile.import(data);
      artboard12 = file.mainArtboard;
      artboard12.addController(controller12 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Watermelon.riv").then((data) {
      final file = RiveFile.import(data);
      artboard13 = file.mainArtboard;
      artboard13.addController(controller13 = SimpleAnimation("splash"));
    });
    rootBundle.load("fruits/Watermelon.riv").then((data) {
      final file = RiveFile.import(data);
      artboard14 = file.mainArtboard;
      artboard14.addController(controller14 = SimpleAnimation("splash"));
    });
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _frontAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: math.pi / 2)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(math.pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(_controller);

    _backAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(math.pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: -math.pi / 2, end: 0.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
      ],
    ).animate(_controller);
  }

  int i = 0;

  /// when user onTap, It will run function
  void _toggleSide() {
    if (isFrontVisible) {
      _controller.forward();
      setState(() {
        isFrontVisible = false;
      });

      Timer(Duration(seconds: 10), _turnBack);
    } else {
      _controller.reverse();
      setState(() {
        isFrontVisible = true;
      });
    }
  }

  void _turnBack() {
    if (isFrontVisible) {
      _controller.forward();
      setState(() {
        isFrontVisible = false;
      });
    } else {
      _controller.reverse();
      setState(() {
        isFrontVisible = true;
      });
    }
  }

  static get pronoun {
    List pronoun = [
      'He ',
      'They ',
      'They ',
      'She ',
      'They ',
      'They ',
      'You ',
      'You ',
      'You ',
      'You ',
      'You ',
      'You ',
      'I ',
      'We ',
    ];
    return pronoun;
  }

  static get words {
    List words = [
      'eats ',
      'eat ',
      'eat ',
      'eats ',
      'eat ',
      'eat ',
      'eat ',
      'eat ',
      'eat ',
      'eat ',
      'eat ',
      'eat ',
      'eat ',
      'eat ',
    ];
    return words;
  }

  static get foods {
    List foods = [
      'rice',
      'bread',
      'grapes',
      'chicken',
      'fish',
      'pineapple',
      'apples',
      'oranges',
      'bananas',
      'pasta',
      'eggs',
      'watermelon',
      'salad',
      'potatoes',
    ];
    return foods;
  }

  static get person {
    List person = [
      '(A male)',
      '(2 males)',
      '(3 or more males)',
      '(A female)',
      '(2 females)',
      '(3 or more females)',
      '(A male)',
      '(2 males)',
      '(3 or more males)',
      '(A female)',
      '(2 female)',
      '(3 or more female)',
      '',
      '',
    ];
    return person;
  }

  static get arabPronoun {
    List arabPronoun = [
      ' هُوَ ',
      'هُمَا',
      'هُمْ ',
      'هِيَ ',
      'هُمَا',
      'هُنَّ ',
      'أَنْتَ  ',
      'أَنْتُمَا',
      'أَنُتُم',
      'أَنْتِ  ',
      'أَنْتُمَّا',
      'أَنْتـُنًّ ',
      'أَنَا',
      'نـَحْنُ ',
    ];
    return arabPronoun;
  }

  static get arabWords {
    List arabWords = [
      ' يأكُلُ ',
      ' يأكُلانِ ',
      ' يَأكُلونَ ',
      ' تَأكلُ  ',
      ' تَأكلانِ  ',
      ' تَأكُلنَ',
      ' تَأْكُلُ',
      ' تَأْكُلَانِ',
      ' تَأْكُلُونَ',
      ' تَأْكُلِي',
      ' تَأْكُلَانِ ',
      ' تَأْكُلْنَ ',
      ' آكُلُ ',
      ' أَكَلْنَا',
    ];
    return arabWords;
  }

  static get arabFoods {
    List arabFoods = [
      ' الأَرُزَّ ',
      ' الخُبْزَ ',
      ' العِنَبَ  ',
      ' الدَجَاجَ ',
      'السَمَكَ  ',
      '  الأَنَانَاسََ    ',
      '  التُفَّاحَ ',
      '  البُرْتُقَالَ  ',
      ' المَوْزَ ',
      ' المَعُكُرُونَةَ ',
      ' البَيْضَ   ',
      ' البِطِّيْخَ ',
      ' السَلَطَةَ ',
      ' البَطَاطِسَ    ',
    ];
    return arabFoods;
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Positioned(
              top: 20.0,
              left: 20.0,
              right: 0.0,
              bottom: 20.0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            i = index;
                            if (i == 0) {
                              setState(() {
                                artboard = artboard1;
                              });
                            }
                            if (i == 1) {
                              setState(() {
                                artboard = artboard2;
                              });
                            }
                            if (i == 2) {
                              setState(() {
                                artboard = artboard3;
                              });
                            }
                            if (i == 3) {
                              setState(() {
                                artboard = artboard4;
                              });
                            }
                            if (i == 4) {
                              setState(() {
                                artboard = artboard5;
                              });
                            }
                            if (i == 5) {
                              setState(() {
                                artboard = artboard6;
                              });
                            }
                            if (i == 6) {
                              setState(() {
                                artboard = artboard7;
                              });
                            }
                          });
                          if (isFrontVisible) {
                            _controller.forward();
                            isFrontVisible = false;
                            Timer(Duration(seconds: 10), _turnBack);
                          } else {
                            _controller.reverse();
                            isFrontVisible = true;
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 5,
                                  color: Colors.blueAccent),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(arabPronoun[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 20),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: pronoun[index],
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: person[index],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )),
          Positioned(
              top: 20.0,
              left: 0.0,
              right: 20.0,
              bottom: 20.0,
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            i = index + 7;
                            if (i == 7) {
                              setState(() {
                                artboard = artboard8;
                              });
                            }
                            if (i == 8) {
                              setState(() {
                                artboard = artboard9;
                              });
                            }
                            if (i == 9) {
                              setState(() {
                                artboard = artboard10;
                              });
                            }
                            if (i == 10) {
                              setState(() {
                                artboard = artboard11;
                              });
                            }
                            if (i == 11) {
                              setState(() {
                                artboard = artboard12;
                              });
                            }
                            if (i == 12) {
                              setState(() {
                                artboard = artboard13;
                              });
                            }
                            if (i == 13) {
                              setState(() {
                                artboard = artboard14;
                              });
                            }
                          });
                          if (isFrontVisible) {
                            _controller.forward();
                            isFrontVisible = false;
                            Timer(Duration(seconds: 10), _turnBack);
                          } else {
                            _controller.reverse();
                            isFrontVisible = true;
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 5,
                                  color: Colors.cyanAccent),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(arabPronoun[index + 7],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 20),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: pronoun[index + 7],
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: person[index + 7],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )),
          Container(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: _toggleSide,
              child: AnimatedCard(
                animation: _frontAnimation,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(20),
                      color: Colors.yellowAccent),
                  height: 500,
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        flex: 6,
                        child: Center(
                          child: Text(
                            'Present Tense',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 50,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                width: 400,
                height: 400,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: _toggleSide,
              child: AnimatedCard(
                animation: _backAnimation,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20),
                        color: Colors.white12),
                    height: 500,
                    width: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (artboard != null)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Rive(
                                      artboard: artboard!,
                                      fit: BoxFit.cover,
                                    )),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text.rich(TextSpan(
                                      text: arabPronoun[i],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 45),
                                      children: [
                                        TextSpan(
                                          text: arabWords[i],
                                          style: TextStyle(
                                              color: Colors.indigo,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 45),
                                        ),
                                        TextSpan(
                                          text: arabFoods[i],
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 45),
                                        )
                                      ])),
                                ),
                                SizedBox(height: 15),
                                Text.rich(TextSpan(
                                    text: pronoun[i],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                    children: [
                                      TextSpan(
                                        text: words[i],
                                        style: TextStyle(
                                            color: Colors.indigo,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                      TextSpan(
                                        text: foods[i],
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      )
                                    ])),
                              ],
                            )
                          : Center(
                              child: Text(
                                'Eat',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 40),
                              ),
                            ),
                    )),
                width: 400,
                height: 400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedCard extends StatelessWidget {
  const AnimatedCard(
      {required this.child,
      required this.animation,
      required this.height,
      required this.width,
      Key? key})
      : super(key: key);

  final Widget child;
  final Animation<double> animation;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: _builder,
      child: SizedBox(
        height: height,
        width: width,
        child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            borderOnForeground: false,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: child,
            )),
      ),
    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    var transform = Matrix4.identity();
    transform.setEntry(3, 2, 0.001);
    transform.rotateY(animation.value);
    return Transform(
      transform: transform,
      alignment: Alignment.center,
      child: child,
    );
  }
}
