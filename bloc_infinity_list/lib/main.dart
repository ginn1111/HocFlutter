import 'package:bloc_infinity_list/bloc/comment_bloc.dart';
import 'package:bloc_infinity_list/events/comment_event.dart';
import 'package:bloc_infinity_list/infinity_list_page.dart';
import 'package:bloc_infinity_list/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getCommentFromAPI(0, 20);
    return MaterialApp(
      title: 'Infinity List App',
      home: BlocProvider<CommentBloc>(
        create: (context) => CommentBloc()..add(CommentFetchedEvent()),
        child: InfinityListPage(),
      ),
    );
  }
}
