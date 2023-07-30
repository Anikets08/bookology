import 'dart:ui';
import 'package:bookology/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeroCarosel extends ConsumerStatefulWidget {
  final List<BookModel> bookList;
  const HeroCarosel({Key? key, required this.bookList}) : super(key: key);

  @override
  ConsumerState<HeroCarosel> createState() => _HeroCaroselState();
}

class _HeroCaroselState extends ConsumerState<HeroCarosel> {
  int pageViewIndex = 10 ~/ 2;
  List<BookModel> get bookList => widget.bookList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 500,
      // color: Colors.red,
      child: Stack(
        children: [
          SizedBox(
            child: Center(
              child: CachedNetworkImage(
                imageUrl: bookList[pageViewIndex].cover,
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/bookinfo",
                        arguments: bookList[pageViewIndex],
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                      height: pageViewIndex == index ? 300 : 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: Hero(
                          tag: bookList[index].bookId,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: bookList[index].cover,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const Center(
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
                  style: Theme.of(context).textTheme.headline1?.copyWith(
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
    );
  }
}
