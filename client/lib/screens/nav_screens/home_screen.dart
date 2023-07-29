import 'dart:ui';
import 'package:bookology/common/constants.dart';
import 'package:bookology/models/book_model.dart';
import 'package:bookology/networking/books/controller.dart';
import 'package:bookology/providers/books_provider.dart';
import 'package:bookology/providers/util_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      // color: Colors.red,
                      child: Stack(
                        children: [
                          SizedBox(
                            child: Center(
                              child: Image.network(
                                bookList[pageViewIndex].cover,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                            child: PageView.builder(
                              itemCount: 10,
                              controller: PageController(
                                viewportFraction: 0.6,
                                initialPage: pageViewIndex,
                              ),
                              onPageChanged: (int index) {
                                HapticFeedback.heavyImpact();
                                setState(() {
                                  pageViewIndex = index;
                                });
                              },
                              itemBuilder: (context, index) => Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    top: 65,
                                  ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                    height: pageViewIndex == index ? 300 : 220,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ConstrainedBox(
                                      constraints:
                                          const BoxConstraints.expand(),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: CachedNetworkImage(
                                          imageUrl: bookList[index].cover,
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CupertinoActivityIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 45,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.trending_up,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Trending",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 40,
                                        letterSpacing: -2.8,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    Content(
                      items: bookList,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

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
                  child: MenuBar(),
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

class Content extends ConsumerStatefulWidget {
  final List<BookModel> items;
  const Content({Key? key, required this.items}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContentState();
}

class _ContentState extends ConsumerState<Content> {
  List<BookModel> filteredList() {
    if (ref.watch(genreProvider) == "All") {
      return widget.items;
    } else {
      return widget.items
          .where((element) => element.genre == ref.read(genreProvider))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemCount: filteredList().length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withOpacity(0.1),
              image: DecorationImage(
                image: NetworkImage(
                  filteredList()[index].cover,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        filteredList()[index].name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        filteredList()[index].author == "null"
                            ? "Amitabh Bachchan"
                            : filteredList()[index].author,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            filteredList()[index].votes == "null"
                                ? "0"
                                : filteredList()[index].votes.toString(),
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class MenuBar extends ConsumerWidget {
  const MenuBar({Key? key}) : super(key: key);

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
