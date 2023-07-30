import 'package:bookology/models/book_model.dart';
import 'package:bookology/providers/util_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridviewContent extends ConsumerStatefulWidget {
  final List<BookModel> items;
  const GridviewContent({Key? key, required this.items}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContentState();
}

class _ContentState extends ConsumerState<GridviewContent> {
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
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/bookinfo",
                arguments: filteredList()[index]);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.1),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
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
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
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
          ),
        );
      },
    );
  }
}
