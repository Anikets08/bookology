import 'dart:math';
import 'package:bookology/common/widgets/book_tile.dart';
import 'package:bookology/common/widgets/gradient_container.dart';
import 'package:bookology/providers/books_provider.dart';
import 'package:bookology/providers/util_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var data = ref.watch(buyProvider);
    return Scaffold(
      body: Column(
        children: [
          gradientContainer(
            context: context,
            color: Colors.deepOrangeAccent,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.deepOrange,
                    child: Text(
                      ref.read(hiveProvider).get("name")[0].toUpperCase(),
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ref.read(hiveProvider).get("name").toUpperCase(),
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text("Bought ${data.length} books"),
                      Text(
                          "Read ${data.isEmpty ? 0 : Random().nextInt(data.length == 1 ? 1 : data.length - 1).toString()} books"),
                    ],
                  ),
                  const SizedBox(width: 40),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          data.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text("No Books Bought"),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BookTile(
                        data: data[index],
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
