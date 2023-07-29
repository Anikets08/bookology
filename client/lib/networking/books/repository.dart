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
      final http.Response response =
          await http.get(Uri.parse("http://192.168.29.102:3123/api/books"));
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
    return await http.get(Uri.parse("http://localhost:3000/books/$bookId"));
  }

  Future<http.Response> addBook(Map<String, dynamic> book) async {
    return await http.post(
      Uri.parse("http://localhost:3000/books"),
      body: book,
    );
  }

  Future<http.Response> updateBook(
    String bookId,
    Map<String, dynamic> book,
  ) async {
    return await http.put(
      Uri.parse("http://localhost:3000/books/$bookId"),
      body: book,
    );
  }

  static Future<http.Response> deleteBook(String bookId) async {
    return await http.delete(Uri.parse("http://localhost:3000/books/$bookId"));
  }
}
