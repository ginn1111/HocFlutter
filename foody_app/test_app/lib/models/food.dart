import 'dart:math';

import 'package:flutter/widgets.dart';

class Food {
  String name;
  String urlImage;
  int id;
  int idCategory;
  Duration duration;
  List<String> ingredient;
  Food({
    @required this.name,
    @required this.idCategory,
    @required this.urlImage,
    this.duration,
    this.ingredient,
  }) {
    this.id = Random().nextInt(1000);
  }
}

enum Complexity { Simple, Medium, Hard }
