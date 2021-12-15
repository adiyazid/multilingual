import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatefulWidget {
  final int score;

  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF252c4a);
    Color secondcolor = Colors.blue;
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congratulations",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38.00,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "Score :" "${widget.score}",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 85.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            MaterialButton(
              onPressed: () {
                finish(context);
              },
              color: Colors.blue,
              child: Text("Home"),
            ),
            SizedBox(height: 40.0,
            ),
            Text("share with friends and family",
              style: TextStyle(color: Colors.white,
                fontSize: 15.00,
              ),
            ),
            buildSocialButton(
              icon : FontAwesomeIcons.facebookSquare,
              color : Colors.white,
              onClicked: () => share(SocialMedia.facebook),
            ),
            buildSocialButton(
              icon : FontAwesomeIcons.twitter,
              color : Colors.white,
              onClicked: () => share(SocialMedia.twitter),
            ),
            buildSocialButton(
              icon : Icons.mail,
              color : Colors.white,
              onClicked: () => share(SocialMedia.email),
            ),
            buildSocialButton(
              icon : FontAwesomeIcons.whatsapp,
              color : Colors.white,
              onClicked: () => share(SocialMedia.whatsapp),
            ) //Create a navigator
          ],
        ),
      ),
    );
  }
  Future share(SocialMedia platform) async {
    final subject = 'MultiLingual Daily Web App';
    final text = "Come and join me take this hard quiz. My score is ""${widget.score}. ";
    final urlShare = Uri.encodeComponent('youtube.com');

    final urls = {
      SocialMedia.facebook : 'https://www.facebook.com/sharer/sharer.php?u=$urlShare&t=$text',
      SocialMedia.twitter : 'https://twitter.com/intent/tweet?url=$urlShare&text=$text',
      SocialMedia.email : 'mailto:?subject=$subject&body=$text\n\n$urlShare',
      SocialMedia.whatsapp : 'https://api.whatsapp.com/send?text=$text$urlShare',
    };
    final url = urls[platform]!;
    await launch(url);
  }
}
enum SocialMedia { facebook, twitter, email,whatsapp}

Widget buildSocialButton({required IconData icon, Color? color, required Function() onClicked})
=> InkWell(
  child: Container(
    width : 60,
    height : 60,
    child:  Center(
        child: FaIcon(icon, color:color,size: 40)
    ),
  ),
  onTap: onClicked,
);