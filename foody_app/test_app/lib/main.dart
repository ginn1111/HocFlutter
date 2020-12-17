import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_app/category_page.dart';

import 'foods_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/FoodsPage': (context) => FoodsPage(),
        '/CategoryPage': (context) => CategoryPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        fontFamily: 'Lobster',
      ),
      title: 'Foody App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Foody App'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(child: CategoryPage()),
        ),
      ),
    );
  }
}
