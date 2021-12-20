import 'dart:async';

import 'package:flip_board/flip_widget.dart';
import 'package:flutter/material.dart';

class ColorTapCountPage extends StatelessWidget {
  const ColorTapCountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Tap Count')),
      body: Center(
        child: _PronounTapCount(const [
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
        ]),
      ),
    );
  }
}

class _PronounTapCount extends StatefulWidget {
  _PronounTapCount(this.pronoun);

  List pronoun = [];

  @override
  _PronounTapCountState createState() => _PronounTapCountState();
}

class _PronounTapCountState extends State<_PronounTapCount> {
  final _colorTapCounts = <String, int>{};
  final _flipController = StreamController<ProNounCount>();
  bool onFlip = true;
  bool isFlip = false;
  var i;

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

  static get image {
    List image = [
      'assets/png/animal/bear.png',
      'assets/png/animal/camel.png',
      'assets/png/animal/cat.png',
      'assets/png/animal/chicken.png',
      'assets/png/animal/cow.png',
      'assets/png/animal/dog.png',
      'assets/png/animal/elephent.png',
      'assets/png/animal/horse.png',
      'assets/png/animal/lion.png',
      'assets/png/animal/sheep.png',
      'assets/png/animal/whale.png',
      'assets/png/occupation/architek.png',
      'assets/png/occupation/chef.png',
      'assets/png/occupation/doctor.png',
    ];
    return image;
  }

  @override
  void initState() {
    super.initState();
    for (final pronoun in widget.pronoun) {
      _colorTapCounts[pronoun] = 0;
    }
  }

  @override
  void dispose() {
    _flipController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 14,
            ),
            itemCount: widget.pronoun.length,
            itemBuilder: (BuildContext context, int index) {
              return Material(
                shape: CircleBorder(),
                color: Colors.white,
                child: InkWell(
                  onTap: (onFlip)
                      ? () => _onTap(index)
                      : () {
                          setState(() {
                            onFlip = true;
                            isFlip = false;
                          });
                          _flipController.add(ProNounCount(i));
                        },
                  customBorder: CircleBorder(),
                  child: SizedBox(
                    width: 100.0,
                    height: 130.0,
                    child: Center(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: widget.pronoun[index],
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: person[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]))),
                  ),
                ),
              );
            },
          ),
          // const SizedBox(height: 80.0),
          Container(
              alignment: Alignment.center,
              child: GestureDetector(
                child: _tapCountWidget,
                onTap: (isFlip)
                    ? () {
                        setState(() {
                          onFlip = true;
                          isFlip = false;
                        });
                        _flipController.add(ProNounCount(i));
                      }
                    : null,
              )),
        ],
      );

  void _onTap(int? pronoun) {
    setState(() {
      i = pronoun;
      onFlip = false;
      isFlip = true;
    });
    _flipController.add(ProNounCount(pronoun!));
  }

  Widget get _tapCountWidget => FlipWidget(
        flipType: FlipType.spinFlip,
        itemStream: _flipController.stream,
        itemBuilder: _flashCardBuilder,
        flipDirection: AxisDirection.right,
        flipDuration: const Duration(milliseconds: 1200),
      );

  Widget _flashCardBuilder(BuildContext _, ProNounCount? colorCount) {
    return _container(
      color: Colors.greenAccent,
      no: colorCount?.count ?? 0,
    );
  }

  Widget _container({required Color color, required int no}) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(),
          borderRadius: BorderRadius.circular(4.0),
        ),
        width: 250,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              child: Expanded(child: Center(child: Image.asset(image[no]))),
              visible: isFlip,
            ),
            Visibility(
              child: Text(
                'Akulu',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50),
              ),
              visible: onFlip,
            ),
            SizedBox(height: 5),
            Visibility(
              child: Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Sentence ',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        children: const [
                          TextSpan(
                            text: '& ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          TextSpan(
                            text: 'Translate',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          )
                        ])),
              ),
              visible: isFlip,
            ),
            SizedBox(height: 5),
          ],
        ),
      );
}

class ProNounCount {
  const ProNounCount(this.count);

  final int count;
}
