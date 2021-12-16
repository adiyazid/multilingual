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

  static get arab {
    List arab = [
      'هُوَ ',
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
    return arab;
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
                    Expanded(flex: 5, child: Image.asset(image[index])),
                    SizedBox(height: 5),
                    Text.rich(TextSpan(
                        text: 'Words ',
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
                            text: 'Sentence',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          )
                        ])),
                  ],
                )),
            backWidget: Container(
              height: 500,
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
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
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text.rich(TextSpan(
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
                    ),
                  ),
                ],
              ),
            ),
            width: 400,
            height: 400,
          ));
}
