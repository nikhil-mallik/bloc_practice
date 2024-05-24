import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../model/post_item_model.dart';
import '../../repository/post_repo.dart';
import '../../utils/enums.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepo postRepo = PostRepo();
  List<PostModel> tempPostList = [];
  PostBloc() : super(const PostState()) {
    on<FetchPosts>(fetchPostsData);
    on<SearchPost>(_filterPost);
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

  void _filterPost(SearchPost event, Emitter<PostState> states) async {
    if (event.searchText.isEmpty) {
      states(state.copyWith(tempPostList: [], searchMessage: ''));
    } else {
      /*Search Condition with one field*/
      // tempPostList = state.postList
      //     .where(
      //         (element) => element.email.toString().toLowerCase().contains(event.searchText.toLowerCase()) )
      //     .toList();

      /*Search Condition with multiple field*/
      final tempPostList = state.postList.where((element) {
        final searchTextLower = event.searchText.toLowerCase();
        final idMatches = element.id.toString() == event.searchText;
        final emailMatches =
            element.email.toString().toLowerCase().contains(searchTextLower);
        final nameMatches =
            element.name.toString().toLowerCase().contains(searchTextLower);
        return idMatches || emailMatches || nameMatches;
      }).toList();

      // data not found then tempPostList will be empty
      if (tempPostList.isEmpty) {
        states(state.copyWith(
            tempPostList: tempPostList, searchMessage: 'No Data Found'));
      }
      states(state.copyWith(tempPostList: tempPostList, searchMessage: ''));
    }
  }
}
