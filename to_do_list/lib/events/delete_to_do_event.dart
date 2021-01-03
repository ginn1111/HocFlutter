import 'package:to_do_list/base/base_event.dart';
import 'package:to_do_list/models/to_do.dart';

class DeleteToDoEvent extends BaseEvent {
  ToDo toDo;
  DeleteToDoEvent({this.toDo});
}
