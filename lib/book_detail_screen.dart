import 'package:flutter/material.dart';
import 'book.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Author: ${book.author}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Rating: ${book.rating}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Read: ${book.isRead ? 'Yes' : 'No'}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
