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
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/bookinfo',
                              arguments: data[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(data[index].cover),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    "#${data[index].genre}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    data[index].author,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  Text(
                                    "Reads: ${data[index].votes.toString()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
