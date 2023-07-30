import 'package:bookology/common/widgets/book_tile.dart';
import 'package:bookology/common/widgets/gradient_container.dart';
import 'package:bookology/providers/books_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class FavScreen extends ConsumerStatefulWidget {
  const FavScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavScreenState();
}

class _FavScreenState extends ConsumerState<FavScreen> {
  @override
  Widget build(BuildContext context) {
    var data = ref.watch(favouriteProvider);
    return Scaffold(
      body: Column(
        children: [
          gradientContainer(
            context: context,
            color: Colors.greenAccent,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Favorites",
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
          ),
          data.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text("No Favourites"),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BookTile(data: data[index]);
                    },
                  ),
                )
        ],
      ),
    );
  }
}
