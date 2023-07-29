class BookModel {
  String bookId;
  String name;
  String author;
  String votes;
  String cover;
  String url;
  String genre;

  BookModel({
    required this.bookId,
    required this.name,
    required this.author,
    required this.votes,
    required this.cover,
    required this.url,
    required this.genre,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      bookId: json['book_id'].toString(),
      name: json['name'],
      author: json['author'].toString(),
      votes: json['votes'].toString(),
      cover: json['cover'],
      url: json['url'],
      genre: json['genre'],
    );
  }

  Map<String, dynamic> toJson() => {
        'bookId': bookId,
        'name': name,
        'author': author,
        'votes': votes,
        'cover': cover,
        'url': url,
        'genre': genre,
      };
}
