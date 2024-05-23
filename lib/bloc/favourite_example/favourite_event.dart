import 'package:equatable/equatable.dart';

import '../../model/favourite_item_model.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteEvent {}

class FavouriteItem extends FavouriteEvent {
  final FavouriteItemModel itemModel;
  const FavouriteItem({required this.itemModel});
}

class SelectItem extends FavouriteEvent {
  final FavouriteItemModel itemModel;
  const SelectItem({required this.itemModel});
}

class UnSelectItem extends FavouriteEvent {
  final FavouriteItemModel itemModel;
  const UnSelectItem({required this.itemModel});
}

class DeleteFavouriteItem extends FavouriteEvent {}
