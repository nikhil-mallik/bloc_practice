import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../repository/post_repo.dart';
import '../../utils/enums.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepo postRepo = PostRepo();
  PostBloc() : super(const PostState()) {
    on<FetchPosts>(fetchPostsData);
  }

  void fetchPostsData(FetchPosts event, Emitter<PostState> states) async {
    await postRepo.fetchPost().then((val) {
      states(state.copyWith(
        postStatus: PostStatus.success,
        message: 'Success',
        postList: val,
      ));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      states(state.copyWith(
        postStatus: PostStatus.failure,
        message: error.toString(),
      ));
    });
  }
}
