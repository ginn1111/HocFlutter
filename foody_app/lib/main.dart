import 'package:flutter/material.dart';
import 'package:foody_app/food_page.dart';
import 'category_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.redAccent, fontFamily: 'Lobster'),
      initialRoute: '/',
      routes: {
        '/FoodPage': (context) => FoodPage(),
        '/CategoryPage': (context) => CategoryPage()
      },
      title: 'Foody App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Foody App'),
        ),
        body: SafeArea(
          child: CategoryPage(),
        ),
      ),
    );
  }
}
