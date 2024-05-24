import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class FetchPosts extends PostEvent {}

class SearchPost extends PostEvent {
  final String searchText;
  const SearchPost(this.searchText);
}
