import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'book_provider.dart';
import 'preferences_service.dart';
import 'theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PreferencesService()),
        ChangeNotifierProvider(create: (_) => BookProvider()),
        ChangeNotifierProvider(
          create: (context) =>
              ThemeProvider(context.read<PreferencesService>()),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'MyBook Library',
            theme: themeProvider.themeData,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
