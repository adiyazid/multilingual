library flash_card;

import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';

/// UI flash card, commonly found in language teaching to children
class MyHomePage extends StatefulWidget {
  const MyHomePage(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  static get person {
    List pronoun = [
      '(A Male)',
      '(2 males)',
      '(3 or more males)',
      '(A female)',
      '(2 females)',
      '(3 or more females)',
      '(A Male)',
      '(2 Male)',
      '(3 or more males)',
      '(A female)',
      '(2 female)',
      '(3 or more female)',
      '',
      '',
    ];
    return pronoun;
  }

  static get arab {
    List pronoun = [
      ' هُوَ',
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
    return pronoun;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(48.0),
          child: GridView.builder(
            itemCount: flashCard.length,
            itemBuilder: (context, index) {
              return flashCard[index];
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 19 / 20,
              crossAxisCount: 4,
            ),
          ),
        ));
  }

  final List<FlashCard> flashCard = List.generate(
      14,
      (index) => FlashCard(
            key: Key(index.toString()),
            frontWidget: SizedBox(
                height: 200,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(TextSpan(
                        text: pronoun[index],
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        children: [
                          TextSpan(
                            text: person[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          )
                        ])),
                  ],
                )),
            backWidget: Container(
              height: 200,
              width: 200,
              child: Center(
                child: Text(
                  arab[index],
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 50,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            width: 300,
            height: 400,
          ));
}
