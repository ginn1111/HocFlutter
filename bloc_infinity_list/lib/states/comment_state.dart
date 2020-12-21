import 'package:bloc_infinity_list/models/comment.dart';
import 'package:equatable/equatable.dart';

abstract class CommentState extends Equatable {
  const CommentState();
  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}

class CommentFailure extends CommentState {}

class CommentSuccess extends CommentState {
  final List<Comment> comments;
  final bool hasReachedEnd;
  CommentSuccess({this.comments, this.hasReachedEnd});
  @override
  List<Object> get props => [comments, hasReachedEnd];
  CommentSuccess cloneWith({List<Comment> comments, bool hasRechedEnd}) {
    return CommentSuccess(
        comments: comments ?? this.comments,
        hasReachedEnd: hasRechedEnd ?? this.hasReachedEnd);
  }
}
