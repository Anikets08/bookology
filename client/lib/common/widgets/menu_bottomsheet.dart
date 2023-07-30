import 'dart:ui';
import 'package:bookology/common/widgets/menu_bar.dart';
import 'package:flutter/material.dart';

buildBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    isScrollControlled: true,
    elevation: 0,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
          child: Container(
            height: 410,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 5,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: MenuBarCustom(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      );
    },
  );
}
