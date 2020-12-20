import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/events/counter_event.dart';

class CountBloc extends Bloc<CounterEvent, int> {
  CountBloc() : super(0);
  // int get initalState => 0;

  // void inscrement() => emit(state + 1);
  // void descrement() => emit(state - 1);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        int newState = state + 1;
        yield newState;
        break;
      case CounterEvent.descremnet:
        int newState = state - 1;
        yield newState;
        break;
    }
  }
}
