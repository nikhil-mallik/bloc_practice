import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../model/post_item_model.dart';
import '../../repository/post_repo.dart';
import '../../utils/enums.dart';

part 'post_event.dart';

part 'post_state.dart';


/// A BLoC (Business Logic Component) responsible for managing post-related data and business logic.
class PostBloc extends Bloc<PostEvent, PostState> {
  // Repository for handling post-related data operations.
  final PostRepo postRepo = PostRepo();

  // Temporary list to hold filtered post data.
  List<PostModel> tempPostList = [];

  /// Constructor for PostBloc, initializing with an initial state and defining event handlers.
  PostBloc() : super(const PostState()) {
    on<FetchPosts>(fetchPostsData);
    on<SearchPost>(_filterPost);
  }

  /// Method to fetch post data from the repository.
  void fetchPostsData(FetchPosts event, Emitter<PostState> states) async {
    await postRepo.fetchPost().then((val) {
      states(state.copyWith(
        postStatus: PostStatus.success, message: 'Success', postList: val,));
    }).onError((error, stackTrace) {
      // Handling error scenario.
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      states(state.copyWith(
        postStatus: PostStatus.failure, message: error.toString(),));
    });
  }

  /// Method to filter post data based on search criteria.
  void _filterPost(SearchPost event, Emitter<PostState> states) async {
    if (event.searchText.isEmpty) {
      // If search text is empty, clear the temporary list and search message.
      states(state.copyWith(tempPostList: [], searchMessage: ''));
    } else {
      // Filter post data based on search criteria.
      final tempPostList = state.postList.where((element) {
        final searchTextLower = event.searchText.toLowerCase();
        final idMatches = element.id.toString() == event.searchText;
        final emailMatches = element.email.toString().toLowerCase().contains(
            searchTextLower);
        final nameMatches = element.name.toString().toLowerCase().contains(
            searchTextLower);
        return idMatches || emailMatches || nameMatches;
      }).toList();

      // If no data is found, update search message accordingly.
      if (tempPostList.isEmpty) {
        states(state.copyWith(
            tempPostList: tempPostList, searchMessage: 'No Data Found'));
      }
      states(state.copyWith(tempPostList: tempPostList, searchMessage: ''));
    }
  }
}

