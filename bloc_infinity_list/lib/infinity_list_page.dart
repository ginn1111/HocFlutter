import 'package:bloc_infinity_list/events/comment_event.dart';
import 'package:bloc_infinity_list/states/comment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/comment_bloc.dart';

class InfinityListPage extends StatefulWidget {
  @override
  _InfinityListPageState createState() => _InfinityListPageState();
}

class _InfinityListPageState extends State<InfinityListPage> {
  CommentBloc _commentBloc;
  final _scrollController = ScrollController();
  final _scrollThread = 250.0;
  @override
  void initState() {
    super.initState();
    _commentBloc = BlocProvider.of(context);
    _scrollController.addListener(() {
      final maxScrollExtend = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (maxScrollExtend - currentScroll <= _scrollThread) {
        _commentBloc.add(CommentFetchedEvent());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if (state is CommentInitial) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CommentFailure) {
            return Center(
                child: Text(
              'Cannot load comments from server!',
              style: TextStyle(fontSize: 30, color: Colors.red),
            ));
          }
          if (state is CommentSuccess) {
            if (state.comments.isEmpty) {
              return Center(
                child: Text(
                  'Comment not found!',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              );
            } else {
              return ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if (state.comments.length <= index) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                        ),
                      ),
                    );
                  }
                  return ListTile(
                    isThreeLine: true,
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        '${state.comments[index].id}',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    title: Text(
                      '${state.comments[index].email}',
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    subtitle: Text(
                      '${state.comments[index].body}',
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                  );
                },
                itemCount: state.hasReachedEnd
                    ? state.comments.length
                    : state.comments.length + 1,
              );
            }
          }
          return Center(
              child: Text(
            'Other state...',
            style: TextStyle(fontSize: 30, color: Colors.blue),
          ));
        },
      )),
    );
  }
}
