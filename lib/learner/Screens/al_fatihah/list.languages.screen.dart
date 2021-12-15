import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:learningapp/learner/Screens/comic/japan/japan.comic.screen.dart';
import 'package:nb_utils/nb_utils.dart';

class ListLanguagesScreen extends StatefulWidget {
  const ListLanguagesScreen({Key? key}) : super(key: key);

  @override
  _ListLanguagesScreenState createState() => _ListLanguagesScreenState();
}

class _ListLanguagesScreenState extends State<ListLanguagesScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFfaf5f5),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Choose Languages",
            style: TextStyle(color: black, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
            padding: const EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
            children: <Widget>[
              //English - LANG1
              Card(
                child:  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/alfatihah',
                          arguments: {'lang': 'LANG1',});
                      //print("tapped");

                    },
                    child: ListTile(
                        title: Text("English (UK)"),
                        leading: CircleAvatar(backgroundImage: AssetImage(
                            "assets/png/languages/uk_flag.png"))
                    )),
              ),


              //Malay - LANG2
              Card(
                child:  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/alfatihah',
                          arguments: {'lang': 'LANG2',});
                    },
                    child: ListTile(
                        title: Text("Malay"),
                        leading: CircleAvatar(backgroundImage: AssetImage(
                            "assets/png/languages/malaysia_flag.png"))
                    )),
              ),


              //Mandarin - LANG3
              Card(
                child:  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/alfatihah',
                          arguments: {'lang': 'LANG3',});
                    },
                    child: ListTile(
                        title: Text("Mandarin"),
                        leading: CircleAvatar(backgroundImage: AssetImage(
                            "assets/png/languages/china_flag.png"))
                    )),
              ),


              //Korean - LANG4
              Card(
                child:  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/alfatihah',
                          arguments: {'lang': 'LANG4',});
                    },
                    child: ListTile(
                        title: Text("Korean"),
                        leading: CircleAvatar(backgroundImage: AssetImage(
                            "assets/png/languages/korea_flag.png"))
                    )),
              ),


              //Turkey - LANG5
              Card(
                child:  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/alfatihah',
                          arguments: {'lang': 'LANG5',});
                    },
                    child: ListTile(
                        title: Text("Turkish"),
                        leading: CircleAvatar(backgroundImage: AssetImage(
                            "assets/png/languages/turkey_flag.png"))
                    )),
              ),


              Card(
                child:  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JapanComicScreen()),);
                      print("tapped");
                    },
                    child: ListTile(
                        title: Text("Japanese"),
                        leading: CircleAvatar(backgroundImage: AssetImage(
                            "assets/png/languages/japan_flag.png"))
                    )),
              )
            ]));
  }
}