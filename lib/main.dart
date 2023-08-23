import 'package:flutter/material.dart';
import 'package:my_provider/provider/auth_provider.dart';
import 'package:my_provider/provider/count_provider.dart';
import 'package:my_provider/provider/favourite_provider.dart';
import 'package:my_provider/provider/slider_provider.dart';
import 'package:my_provider/provider/theme_changer_provider.dart';
import 'package:my_provider/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => SliderProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "My Provider Practice",
            themeMode: themeChanger.themeMode,
            darkTheme: ThemeData(
                appBarTheme: const AppBarTheme(color: Colors.amber),
                brightness: Brightness.dark,
                iconTheme: const IconThemeData(color: Colors.redAccent)),
            theme: ThemeData(
                primarySwatch: Colors.blue, brightness: Brightness.light),
            home: const LoginScreen(),
          );
        }));
  }
}
