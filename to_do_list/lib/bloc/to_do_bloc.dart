import 'dart:async';

import 'package:to_do_list/base/base_bloc.dart';
import 'package:to_do_list/base/base_event.dart';
import 'package:to_do_list/database/to_do_table.dart';
import 'package:to_do_list/events/add_to_do_event.dart';
import 'package:to_do_list/events/delete_to_do_event.dart';
import 'package:to_do_list/events/initial_to_do_event.dart';
import 'package:to_do_list/models/to_do.dart';

class ToDoBloc extends BaseBloc {
  ToDoTable _toDoTable = ToDoTable();
  StreamController<List<ToDo>> _blocController = StreamController<List<ToDo>>();
  List<ToDo> _res = [];
  Stream<List<ToDo>> get toDoStream => _blocController.stream;

  _addToDo(ToDo todo) async {
    await _toDoTable.insertToDo(todo);
    _res.add(todo);
    _blocController.sink.add(_res);
  }

  _deleteToDo(ToDo todo) async {
    await _toDoTable.deleteToDo(todo);
    _res.remove(todo);
    _blocController.sink.add(_res);
  }

  _initToDo() async {
    _res = await _toDoTable.selectAllToDo();
    _blocController.sink.add(_res);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddToDoEvent) {
      _addToDo(event.toDo);
    } else if (event is DeleteToDoEvent) {
      _deleteToDo(event.toDo);
    } else if (event is InitialToDoEvent) {
      _initToDo();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _blocController.close();
  }
}
