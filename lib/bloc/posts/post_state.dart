part of 'post_bloc.dart';

/// Class representing the state of post-related data.
class PostState extends Equatable {
  /// Constructor for PostState, with default values for its properties.
  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.tempPostList = const <PostModel>[],
    this.message = '',
    this.searchMessage = '',
  });

  /// Status of post data.
  final PostStatus postStatus;

  /// List of posts.
  final List<PostModel> postList;

  /// Temporary list of posts used for filtering.
  final List<PostModel> tempPostList;

  /// Message associated with the post state.
  final String message;

  /// Message associated with the search operation.
  final String searchMessage;

  /// Method to create a copy of the current state with some updated values.
  PostState copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    String? message,
    List<PostModel>? tempPostList,
    String? searchMessage,
  }) {
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
