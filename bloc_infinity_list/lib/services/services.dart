import 'dart:convert';

import 'package:bloc_infinity_list/models/comment.dart';
import 'package:http/http.dart' as http;

Future<List<Comment>> getCommentFromAPI(int start, int limit) async {
  final String url =
      "https://jsonplaceholder.typicode.com/comments?_start=$start&_limit=$limit";
  final http.Client httpClient = http.Client();
  try {
    final respone = await httpClient.get(url);
    if (respone.statusCode == 200) {
      final responeData = json.decode(respone.body) as List;
      final List<Comment> comments = responeData
          .map((comment) => Comment(
              id: comment['id'],
              name: comment['name'],
              email: comment['email'],
              body: comment['body']))
          .toList();
      return comments;
    } else {
      return <Comment>[];
    }
  } catch (e) {
    print(e.toString());
  }
  return <Comment>[];
}
