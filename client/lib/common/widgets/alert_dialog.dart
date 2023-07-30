import 'package:bookology/common/constants.dart';
import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white,
    title: const Text("Happy Reading!", style: TextStyle(color: Colors.black)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Your book has been added to your reading list.",
          style: TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 40),
        Image.asset(
          splashImage,
          height: 100,
        ),
      ],
    ),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
