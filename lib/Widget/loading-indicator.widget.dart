import 'package:flutter/material.dart';

class LoadingIndicator {
  static Future<void> showLoadingDialog(BuildContext context) async {
    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 150),
      barrierColor: Colors.black12,
      pageBuilder: (BuildContext context, a1, a2) {
        return const SafeArea(
          child: SimpleDialog(

              backgroundColor: Colors.transparent,
              elevation: 0,
              children: <Widget>[
                Center(child: CircularProgressIndicator())
              ]),
        );
      },
    );
  }
}
