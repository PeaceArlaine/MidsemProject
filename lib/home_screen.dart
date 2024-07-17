import 'package:flutter/material.dart';
import 'package:midsem/preferences_service.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';
import 'book.dart';
import 'add_edit_book_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Library'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Consumer<BookProvider>(
              builder: (context, bookProvider, child) {
                final sortPreference =
                    context.watch<PreferencesService>().sortPreference;
                final books = bookProvider.books
                    .where((book) =>
                        book.title.contains(_searchQuery) ||
                        book.author.contains(_searchQuery))
                    .toList()
                  ..sort((a, b) {
                    switch (sortPreference) {
                      case 'title':
                        return a.title.compareTo(b.title);
                      case 'author':
                        return a.author.compareTo(b.author);
                      case 'rating':
                        return b.rating.compareTo(a.rating);
                      default:
                        return a.title.compareTo(b.title);
                    }
                  });

                return ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return ListTile(
                      title: Text(book.title),
                      subtitle: Text(book.author),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    AddEditBookScreen(book: book),
                              ));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              Provider.of<BookProvider>(context, listen: false)
                                  .deleteBook(book.id!);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        // Navigate to book detail screen if needed
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddEditBookScreen(),
          ));
        },
      ),
    );
  }
}
