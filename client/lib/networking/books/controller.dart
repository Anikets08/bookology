import 'package:bookology/models/book_model.dart';
import 'package:bookology/networking/books/repository.dart';
import 'package:bookology/providers/books_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookControllerProvider = Provider((ref) => BookController(
      bookRepository: ref.read(bookRepositoryProvider),
      ref: ref,
    ));

class BookController {
  final BookRepository bookRepository;
  final Ref _ref;
  BookController({required this.bookRepository, required ref}) : _ref = ref;

  void getBooks() async {
    final res = await bookRepository.getBooks();
    return res.fold(
      (l) => print(l["message"]),
      (r) => _ref.read(bookProvider.notifier).state = List<BookModel>.from(
        r["data"].map((book) => BookModel.fromJson(book)),
      ),
    );
  }
}
