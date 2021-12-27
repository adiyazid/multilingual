library flash_card;

import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';

/// UI flash card, commonly found in language teaching to children
class FlashCardScreen extends StatefulWidget {
  const FlashCardScreen(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  State<FlashCardScreen> createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  int i = 0;

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
            shrinkWrap: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: flashCard.length,
            itemBuilder: (context, index) {
              return flashCard[index];
            },
          ),
        ));
  }

  final List<FlashCard> flashCard = List.generate(
      14,
      (index) => FlashCard(
            key: Key(index.toString()),
            frontWidget: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    color: Colors.white),
                height: 500,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(flex: 5, child: Image.asset(image[index])),
                      SizedBox(height: 15),
                      Expanded(
                        flex: 3,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text.rich(TextSpan(
                              text: arabPronoun[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45),
                              children: [
                                TextSpan(
                                  text: arabWords[index],
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 45),
                                ),
                                TextSpan(
                                  text: arabFoods[index],
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 45),
                                )
                              ])),
                        ),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        flex: 3,
                        child: Text.rich(TextSpan(
                            text: pronoun[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                            children: [
                              TextSpan(
                                text: words[index],
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              TextSpan(
                                text: foods[index],
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              )
                            ])),
                      ),
                    ],
                  ),
                )),
            backWidget: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5),
                  color: Colors.yellowAccent),
              height: 500,
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Center(
                      child: Text(
                        arabPronoun[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 50,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Center(
                        child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: pronoun[index],
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          TextSpan(
                            text: person[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    )),
                  )
                ],
              ),
            ),
            width: 400,
            height: 400,
          ));
}
