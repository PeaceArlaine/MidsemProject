import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'preferences_service.dart';
import 'theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sort By:', style: TextStyle(fontSize: 18)),
            ListTile(
              title: Text('Title'),
              leading: Radio(
                value: 'title',
                groupValue: context.watch<PreferencesService>().sortPreference,
                onChanged: (value) {
                  context
                      .read<PreferencesService>()
                      .setSortPreference(value as String);
                },
              ),
            ),
            ListTile(
              title: Text('Author'),
              leading: Radio(
                value: 'author',
                groupValue: context.watch<PreferencesService>().sortPreference,
                onChanged: (value) {
                  context
                      .read<PreferencesService>()
                      .setSortPreference(value as String);
                },
              ),
            ),
            ListTile(
              title: Text('Rating'),
              leading: Radio(
                value: 'rating',
                groupValue: context.watch<PreferencesService>().sortPreference,
                onChanged: (value) {
                  context
                      .read<PreferencesService>()
                      .setSortPreference(value as String);
                },
              ),
            ),
            Divider(),
            Text('Theme:', style: TextStyle(fontSize: 18)),
            SwitchListTile(
              title: Text('Dark Mode'),
              value:
                  context.watch<ThemeProvider>().themeData == ThemeData.dark(),
              onChanged: (value) {
                context.read<ThemeProvider>().toggleTheme(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
