part of 'post_bloc.dart';

/// Abstract class representing events related to posts.
abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

/// Event to fetch posts data.
class FetchPosts extends PostEvent {}

/// Event to search posts based on a search text.
class SearchPost extends PostEvent {
  /// The text to search for.
  final String searchText;

  /// Constructor for SearchPost event.
  const SearchPost(this.searchText);

  @override
  List<Object?> get props => [searchText];
}
