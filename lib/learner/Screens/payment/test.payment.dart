import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TestPayment extends StatefulWidget {
  const TestPayment({Key? key}) : super(key: key);

  @override
  _TestPaymentState createState() => _TestPaymentState();
}

class _TestPaymentState extends State<TestPayment> {
  static const String _url = 'http://localhost/wordpress/shop/';

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Testing payment'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: _launchURL,
                    child: Text('Pay using wordpress paypal')),
                SizedBox(height: 30),
                ElevatedButton(
                    onPressed: _launchURL, child: Text('Pay using stripe')),
              ]),
        ));
  }
}
