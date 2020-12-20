import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/count_bloc.dart';
import 'package:test_app/events/counter_event.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final CountBloc countBloc = context.bloc<CountBloc>();
    //CountBloc countBloc = context.bloc<CountBloc>();
    return Scaffold(
      body: SafeArea(child: BlocBuilder<CountBloc, int>(
        builder: (context, counter) {
          return Center(
              child: Text(
            'Result: $counter',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ));
        },
      )),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // => context.read<CountBloc>().inscrement()
            // => context.read<CountBloc>().descrement()
            onPressed: () => countBloc.add(CounterEvent.increment),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          FloatingActionButton(
            onPressed: () => countBloc.add(CounterEvent.descremnet),
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
