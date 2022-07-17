import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.label
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          shape: CircularNotchedRectangle(),
          

        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.red,
            primary: Colors.blue,
          ),
        )
      ),
      home: const HomePage(),
    );
  }
}

