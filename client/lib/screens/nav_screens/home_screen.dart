import 'package:bookology/common/widgets/hero_carousel.dart';
import 'package:bookology/common/widgets/hero_gridview.dart';
import 'package:bookology/common/widgets/menu_bottomsheet.dart';
import 'package:bookology/networking/books/controller.dart';
import 'package:bookology/providers/books_provider.dart';
import 'package:bookology/providers/util_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int pageViewIndex = 10 ~/ 2;

  @override
  void initState() {
    super.initState();
    ref.read(bookControllerProvider).getBooks();
  }

  @override
  Widget build(BuildContext context) {
    var bookList = ref.watch(bookProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildBottomSheet(context);
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.list),
      ),
      body: bookList.isEmpty
          ? const Center(child: CupertinoActivityIndicator())
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Column(
                  children: [
                    HeroCarosel(bookList: bookList),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Hey 👋🏻 ${ref.read(hiveProvider).get("name")}",
                          style:
                              Theme.of(context).textTheme.headline1?.copyWith(
                                    color: Colors.white,
                                    fontSize: 40,
                                    letterSpacing: -2.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "What would you like to read today?",
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    GridviewContent(
                      items: bookList,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
