import 'package:to_do_list/base/base_event.dart';
import 'package:to_do_list/models/to_do.dart';

class AddToDoEvent extends BaseEvent {
  ToDo toDo;
  AddToDoEvent({this.toDo});
}
