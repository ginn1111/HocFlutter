import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:to_do_list/base/base_event.dart';

abstract class BaseBloc {
  StreamController<BaseEvent> _baseController = StreamController<BaseEvent>();

  Sink<BaseEvent> get event => _baseController.sink;

  BaseBloc() {
    _baseController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception("This is not valid event!");
      } else {
        dispatchEvent(event);
      }
    });
  }

  void dispatchEvent(BaseEvent event);

  @mustCallSuper
  void dispose() {
    _baseController.close();
  }
}
