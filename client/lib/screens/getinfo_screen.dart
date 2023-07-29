import 'package:bookology/providers/util_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetInfoScreen extends ConsumerWidget {
  const GetInfoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController nameController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What should we call you?",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  IconButton(
                    onPressed: () {
                      ref
                          .read(hiveProvider.notifier)
                          .state
                          .put("name", nameController.text);
                      Navigator.pushReplacementNamed(context, "/home");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
