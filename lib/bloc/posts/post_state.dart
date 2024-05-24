import 'package:equatable/equatable.dart';

import '../../model/post_item_model.dart';
import '../../utils/enums.dart';

class PostState extends Equatable {
  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.tempPostList = const <PostModel>[],
    this.message = '',
    this.searchMessage = '',
  });

  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  final String message;
  final String searchMessage;

  PostState copyWith(
      {PostStatus? postStatus,
      List<PostModel>? postList,
      String? message,
      List<PostModel>? tempPostList,
      String? searchMessage}) {
    return PostState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
      tempPostList: tempPostList ?? this.tempPostList,
    );
  }

  @override
  List<Object?> get props =>
      [postList, postStatus, message, tempPostList, searchMessage];
}
