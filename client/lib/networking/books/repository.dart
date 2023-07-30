import 'dart:convert';
import 'package:bookology/models/book_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

final bookRepositoryProvider = Provider((ref) => BookRepository());

class BookRepository {
  Future<Either<Map, Map>> getBooks() async {
    BookModel bookModel;
    try {
      final http.Response response = await http
          .get(Uri.parse("https://bokology-server.onrender.com/api/books"));
      final decodedData = jsonDecode(response.body);

      return right(
          {"length": decodedData["length"], "data": decodedData["books"]});
    } catch (e) {
      return left({
        "message": "Something went wrong",
      });
    }
  }

  Future<http.Response> getBook(String bookId) async {
    return await http.get(
        Uri.parse("https://bokology-server.onrender.com/api/books/$bookId"));
  }
}
