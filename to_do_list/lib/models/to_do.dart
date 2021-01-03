import 'package:flutter/cupertino.dart';

class ToDo {
  String title;
  int id;
  String content;

  ToDo({this.id, @required this.title, @required this.content});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}
