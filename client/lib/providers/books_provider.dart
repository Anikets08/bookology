import 'package:bookology/models/book_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookProvider = StateNotifierProvider<BookState, List<BookModel>>(
  (ref) => BookState(),
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
