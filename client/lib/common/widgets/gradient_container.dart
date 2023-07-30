import "package:flutter/material.dart";

Widget gradientContainer({
  required Color color,
  required Widget child,
  required BuildContext context,
  Key? key,
}) {
  return Container(
    height: 200,
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.only(top: 40),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          color,
          Colors.black,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: child,
  );
}
