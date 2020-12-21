import 'package:bloc_infinity_list/events/comment_event.dart';
import 'package:bloc_infinity_list/models/comment.dart';
import 'package:bloc_infinity_list/services/services.dart';
import 'package:bloc_infinity_list/states/comment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  static const NUMBER_LIMIT_SCROLL = 20;
  CommentBloc() : super(CommentInitial());
  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    try {
      final bool hasReachEndOfOnePage =
          (state is CommentSuccess && (state as CommentSuccess).hasReachedEnd);
      if (event is CommentFetchedEvent && !hasReachEndOfOnePage) {
        if (state is CommentInitial) {
          // Neu la lan dau thi download comment tu service ve
          final List<Comment> comments =
              await getCommentFromAPI(0, NUMBER_LIMIT_SCROLL);
          yield CommentSuccess(
            comments: comments,
            hasReachedEnd: false,
          );
        } else if (state is CommentSuccess) {
          // Neu khong phai la lan dau va la commentsuccess
          // Thi download page tiep theo
          // Neu list comment isEmpty thi la cuoi trang, nguoc lai thi
          // Download phan tu comment tiep theo
          final currentState = state as CommentSuccess;
          int finalIndexOfCurrentPage = currentState.comments.length;
          final comments = await getCommentFromAPI(
              finalIndexOfCurrentPage, NUMBER_LIMIT_SCROLL);
          if (comments.isEmpty) {
            yield (state as CommentSuccess).cloneWith(hasRechedEnd: true);
          } else {
            yield CommentSuccess(
                comments: currentState.comments + comments,
                hasReachedEnd: false);
          }
        }
      }
    } catch (exception) {
      yield CommentFailure();
    }
  }
}
