import 'package:bookology/models/book_model.dart';
import 'package:bookology/providers/books_provider.dart';
import 'package:bookology/providers/util_provider.dart';

void addToProvider(ref) {
  bool containsFav = ref.read(hiveProvider).containsKey("fav");
  bool containerBuy = ref.read(hiveProvider).containsKey("buy");
  if (containsFav) {
    ref.read(favouriteProvider.notifier).addAll(
          List<BookModel>.from(
            ref.read(hiveProvider).get("fav").map(
                  (book) => BookModel.fromJson(book),
                ),
          ),
        );
  }
  if (containerBuy) {
    print(
      ref.read(hiveProvider).get("buy").map(
            (book) => BookModel.fromJson(book).name,
          ),
    );
    ref.read(buyProvider.notifier).addAll(
          List<BookModel>.from(
            ref.read(hiveProvider).get("buy").map(
                  (book) => BookModel.fromJson(book),
                ),
          ),
        );
  }
}

void addFav(ref, data) async {
  ref.read(favouriteProvider.notifier).addBook(data);
}

void removeFav(ref, data) async {
  ref.read(favouriteProvider.notifier).removeBook(data);
}

void addBuy(ref, data) {
  ref.read(buyProvider.notifier).addBook(data);
}
