import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/database/to_do_database.dart';
import 'package:to_do_list/src/resource/to_do_list_home.dart';

import 'bloc/to_do_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ToDoDatabase.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider<ToDoBloc>.value(value: ToDoBloc(), child: ToDoListHome()),
    );
  }
}
