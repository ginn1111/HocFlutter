import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/count_bloc.dart';
import 'package:test_app/counter_page/counter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Counter App',
        home: BlocProvider<CountBloc>(
          create: (context) => CountBloc(),
          child: CounterPage(),
        ));
  }
}
