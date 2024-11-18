import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'settings_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main Screen',
          style: TextStyle(
            fontFamily: themeProvider.currentFont,
            fontSize: themeProvider.fontSize,
            color: themeProvider.fontColor,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: themeProvider.fontColor),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade300, 
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: themeProvider.fontColor, 
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Niki',
                      style: TextStyle(
                        fontFamily: themeProvider.currentFont,
                        fontSize: themeProvider.fontSize,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.fontColor,
                      ),
                    ),
                    Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontFamily: themeProvider.currentFont,
                        fontSize: themeProvider.fontSize,
                        color: themeProvider.fontColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text(
              'Features',
              style: TextStyle(
                fontFamily: themeProvider.currentFont,
                fontSize: themeProvider.fontSize,
                fontWeight: FontWeight.bold,
                color: themeProvider.fontColor, 
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.settings, color: themeProvider.fontColor),
              title: Text(
                'Settings',
                style: TextStyle(color: themeProvider.fontColor), 
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.info, color: themeProvider.fontColor),
              title: Text(
                'About',
                style: TextStyle(color: themeProvider.fontColor), 
              ),
              onTap: () {
              },
            ),
            const Divider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsScreen()),
          );
        },
        child: const Icon(Icons.settings),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
