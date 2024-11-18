import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: themeProvider.currentFont,
            fontSize: themeProvider.fontSize,
            color: themeProvider.fontColor,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        iconTheme: IconThemeData(color: themeProvider.fontColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose Theme',
                        style: TextStyle(
                          fontFamily: themeProvider.currentFont,
                          fontSize: themeProvider.fontSize,
                          fontWeight: FontWeight.bold,
                          color: themeProvider.fontColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      RadioListTile(
                        title: Text('Blue', style: TextStyle(color: themeProvider.fontColor)),
                        value: 'Theme A',
                        groupValue: themeProvider.currentTheme.primaryColor == Colors.blue
                            ? 'Theme A'
                            : themeProvider.currentTheme.primaryColor == Colors.green
                                ? 'Theme B'
                                : 'Theme C',
                        onChanged: (value) => themeProvider.changeTheme(value!),
                      ),
                      RadioListTile(
                        title: Text('Green', style: TextStyle(color: themeProvider.fontColor)),
                        value: 'Theme B',
                        groupValue: themeProvider.currentTheme.primaryColor == Colors.blue
                            ? 'Theme A'
                            : themeProvider.currentTheme.primaryColor == Colors.green
                                ? 'Theme B'
                                : 'Theme C',
                        onChanged: (value) => themeProvider.changeTheme(value!),
                      ),
                      RadioListTile(
                        title: Text('Purple', style: TextStyle(color: themeProvider.fontColor)),
                        value: 'Theme C',
                        groupValue: themeProvider.currentTheme.primaryColor == Colors.blue
                            ? 'Theme A'
                            : themeProvider.currentTheme.primaryColor == Colors.green
                                ? 'Theme B'
                                : 'Theme C',
                        onChanged: (value) => themeProvider.changeTheme(value!),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose Font',
                        style: TextStyle(
                          fontFamily: themeProvider.currentFont,
                          fontSize: themeProvider.fontSize,
                          fontWeight: FontWeight.bold,
                          color: themeProvider.fontColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      DropdownButton<String>(
                        value: themeProvider.currentFont,
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                            value: 'Roboto',
                            child: Text('Roboto', style: TextStyle(color: Colors.black)),
                          ),
                          DropdownMenuItem(
                            value: 'Courier',
                            child: Text('Courier', style: TextStyle(color: Colors.black)),
                          ),
                          DropdownMenuItem(
                            value: 'Georgia',
                            child: Text('Georgia', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                        onChanged: (value) {
                          themeProvider.changeFont(value!);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose Font Color',
                        style: TextStyle(
                          fontFamily: themeProvider.currentFont,
                          fontSize: themeProvider.fontSize,
                          fontWeight: FontWeight.bold,
                          color: themeProvider.fontColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      DropdownButton<Color>(
                        value: themeProvider.fontColor,
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                            value: Colors.black,
                            child: Text('Black', style: TextStyle(color: Colors.black)),
                          ),
                          DropdownMenuItem(
                            value: Colors.red,
                            child: Text('Red', style: TextStyle(color: Colors.red)),
                          ),
                          DropdownMenuItem(
                            value: Colors.blue,
                            child: Text('Blue', style: TextStyle(color: Colors.blue)),
                          ),
                          DropdownMenuItem(
                            value: Colors.green,
                            child: Text('Green', style: TextStyle(color: Colors.green)),
                          ),
                        ],
                        onChanged: (value) {
                          themeProvider.changeFontColor(value!);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Font Size',
                        style: TextStyle(
                          fontFamily: themeProvider.currentFont,
                          fontSize: themeProvider.fontSize,
                          fontWeight: FontWeight.bold,
                          color: themeProvider.fontColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Slider(
                        value: themeProvider.fontSize,
                        min: 12,
                        max: 24,
                        divisions: 6,
                        label: '${themeProvider.fontSize.toInt()}',
                        onChanged: (value) {
                          themeProvider.changeFontSize(value);
                        },
                      ),
                      Text(
                        'Current Font Size: ${themeProvider.fontSize.toInt()}',
                        style: TextStyle(
                          fontFamily: themeProvider.currentFont,
                          fontSize: themeProvider.fontSize,
                          color: themeProvider.fontColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
