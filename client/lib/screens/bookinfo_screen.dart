import 'package:bookology/common/constants.dart';
import 'package:bookology/models/book_model.dart';
import 'package:bookology/providers/books_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookInfoScreen extends ConsumerStatefulWidget {
  final BookModel? book;
  const BookInfoScreen({Key? key, this.book}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookInfoScreenState();
}

class _BookInfoScreenState extends ConsumerState<BookInfoScreen> {
  @override
  void initState() {
    print(ref.read(favouriteProvider).length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fav = ref.watch(favouriteProvider);
    final bought = ref.watch(buyProvider);

    final BookModel data =
        ModalRoute.of(context)?.settings.arguments as BookModel;

    void addFav() async {
      ref.read(favouriteProvider.notifier).addBook(data);
    }

    void removeFav() async {
      ref.read(favouriteProvider.notifier).removeBook(data);
    }

    void addBuy() {
      ref.read(buyProvider.notifier).addBook(data);
    }

    bool isFav = fav.any((element) => element.bookId == data.bookId);

    // alert dialog to show the book is added to cart
    void showAlertDialog(BuildContext context) {
      // set up the button
      Widget okButton = TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        backgroundColor: Colors.white,
        title:
            const Text("Happy Reading!", style: TextStyle(color: Colors.black)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Your book has been added to your reading list.",
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 40),
            Image.asset(
              splashImage,
              height: 100,
            ),
          ],
        ),
        actions: [
          okButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.headphones,
                    color: Colors.black,
                    size: 20,
                  ),
                  Text(
                    'Listen',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
              onPressed: () {
                bought.any((element) => element.bookId == data.bookId)
                    ? addBuy()
                    : null;
                showAlertDialog(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    bought.any((element) => element.bookId == data.bookId)
                        ? Icons.chrome_reader_mode_rounded
                        : Icons.shopping_cart,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    bought.any((element) => element.bookId == data.bookId)
                        ? 'Read'
                        : 'Buy',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.1),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.1),
                        ),
                      ),
                      onPressed: () {
                        isFav ? removeFav() : addFav();
                      },
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Hero(
                      tag: data.cover,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          data.cover,
                          height: 250,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "#Trending",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data.name,
                            textAlign: TextAlign.left,
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            data.author,
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Rating",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data.votes.toString(),
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(
                                        0.8,
                                      ),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Genre",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data.genre,
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(
                                        0.8,
                                      ),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Language",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "English",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(
                                        0.8,
                                      ),
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.money),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: 1,
                        height: 30,
                        color: Colors.grey,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "₹ 350",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "₹ 500",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                " 30% off",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text("About this book",
                    style: Theme.of(context).textTheme.headline5),
                const SizedBox(height: 10),
                Text(
                  dummyBookDescription,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.white.withOpacity(
                          0.8,
                        ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
