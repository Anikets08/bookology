import 'package:bookology/common/constants.dart';
import 'package:bookology/providers/util_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuBarCustom extends ConsumerWidget {
  const MenuBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...genreList.map(
              (e) => menuButton(
                context,
                e,
                ref.watch(genreProvider) == e,
                ref,
              ),
            ),
          ]),
    );
  }
}

menuButton(BuildContext context, String text, bool isSelected, WidgetRef ref) {
  return GestureDetector(
    onTap: () {
      ref.read(genreProvider.notifier).state = text;
      Navigator.pop(context);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.withOpacity(0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text),
          const Spacer(),
          isSelected
              ? const Icon(
                  Icons.check,
                  size: 16,
                )
              : const SizedBox(),
        ],
      ),
    ),
  );
}
