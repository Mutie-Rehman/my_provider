import 'package:flutter/material.dart';
import 'package:my_provider/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

/*
So this is the main screen for changing the theme. We have added a widget RadioListTile and we have taken a themeMode with that
which tells the widget what theme will be the screen is having. So here we have three type of themes and we can set these themes
in the main screen by using different type of themes and the value we can get here.
 */
class DartThemeScreen extends StatefulWidget {
  const DartThemeScreen({super.key});

  @override
  State<DartThemeScreen> createState() => _DartThemeScreenState();
}

class _DartThemeScreenState extends State<DartThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Change"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: const Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: const Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: const Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Icon(
              Icons.favorite,
              size: 200,
            ),
          ),
        ],
      ),
    );
  }
}
