import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'book.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];
  List<Book> get books => _books;

  BookProvider() {
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final books = await DatabaseHelper().getBooks();
    _books = books;
    notifyListeners();
  }

  Future<void> addBook(Book book) async {
    await DatabaseHelper().insertBook(book);
    await fetchBooks();
  }

  Future<void> updateBook(Book book) async {
    await DatabaseHelper().updateBook(book);
    await fetchBooks();
  }

  Future<void> deleteBook(int id) async {
    await DatabaseHelper().deleteBook(id);
    await fetchBooks();
  }
}
