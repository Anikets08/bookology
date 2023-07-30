import 'package:bookology/models/book_model.dart';
import 'package:bookology/providers/util_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookProvider = StateNotifierProvider<BookState, List<BookModel>>(
  (ref) => BookState(),
);

final buyProvider = StateNotifierProvider<BuyState, List<BookModel>>(
  (ref) => BuyState(
    ref,
  ),
);

final favouriteProvider =
    StateNotifierProvider<FavouriteState, List<BookModel>>(
  (ref) => FavouriteState(ref),
);

class BookState extends StateNotifier<List<BookModel>> {
  BookState() : super([]);
  void addBook(BookModel book) {
    state = [...state, book];
  }

  void removeBook(BookModel book) {
    state = state.where((element) => element.bookId != book.bookId).toList();
  }
}

class BuyState extends StateNotifier<List<BookModel>> {
  Ref _ref;
  BuyState(
    this._ref,
  ) : super([]);

  void addBook(BookModel book) async {
    state = [...state, book];
    await _ref.read(hiveProvider).put(
          "buy",
          state.map((e) => e.toJson()).toList(),
        );
  }

  void addAll(List<BookModel> books) {
    state = books;
  }

  void removeBook(BookModel book) async {
    state = state.where((element) => element.bookId != book.bookId).toList();
    await _ref.read(hiveProvider).put(
          "buy",
          state.map((e) => e.toJson()).toList(),
        );
  }
}

class FavouriteState extends StateNotifier<List<BookModel>> {
  Ref _ref;
  FavouriteState(
    this._ref,
  ) : super([]);

  void addAll(List<BookModel> books) {
    state = books;
  }

  void addBook(BookModel book) async {
    state = [...state, book];
    await _ref.read(hiveProvider).put(
          "fav",
          state.map((e) => e.toJson()).toList(),
        );
  }

  void removeBook(BookModel book) async {
    state = state.where((element) => element.bookId != book.bookId).toList();
    await _ref.read(hiveProvider).put(
          "fav",
          state.map((e) => e.toJson()).toList(),
        );
  }
}
