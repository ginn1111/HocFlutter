import 'dart:math';
import 'package:flutter/material.dart';

class Food {
  String urlName;
  String name;
  int id;
  int idCategory;
  List<String> ingredient;
  int duration;
  Complexity complexity;
  Food(
      {@required this.name,
      @required this.idCategory,
      @required this.urlName,
      this.ingredient,
      this.duration,
      this.complexity}) {
    this.id = Random().nextInt(1000);
  }
}

enum Complexity { simple, medium, hard }
