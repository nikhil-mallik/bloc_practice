import 'package:equatable/equatable.dart';

import '../../model/post_item_model.dart';
import '../../utils/enums.dart';

class PostState extends Equatable {
  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.message = '',
  });

  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  PostState copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [postList, postStatus, message];
}
