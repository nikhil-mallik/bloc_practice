part of 'favourite_bloc.dart';

/// Abstract class FavouriteEvent that extends Equatable to ensure value equality.
abstract class FavouriteEvent extends Equatable {
  // Constructor for FavouriteEvent.
  const FavouriteEvent();

  /// Overriding props method to return an empty list for value comparison.
  @override
  List<Object> get props => [];
}

/// Event class for fetching the favourite list.
class FetchFavouriteList extends FavouriteEvent {}

/// Event class representing a favourite item with a FavouriteItemModel.
class FavouriteItem extends FavouriteEvent {
  // Final variable to hold the favourite item model.
  final FavouriteItemModel itemModel;

  /// Constructor for FavouriteItem with a required itemModel parameter.
  const FavouriteItem({required this.itemModel});

  /// Overriding props method to include itemModel for value comparison.
  @override
  List<Object> get props => [itemModel];
}

// Event class for selecting an item with a FavouriteItemModel.
class SelectItem extends FavouriteEvent {
  /// Final variable to hold the selected item model.
  final FavouriteItemModel itemModel;

  /// Constructor for SelectItem with a required itemModel parameter.
  const SelectItem({required this.itemModel});

  /// Overriding props method to include itemModel for value comparison.
  @override
  List<Object> get props => [itemModel];
}

/// Event class for unselecting an item with a FavouriteItemModel.
class UnSelectItem extends FavouriteEvent {
  /// Final variable to hold the unselected item model.
  final FavouriteItemModel itemModel;

  /// Constructor for UnSelectItem with a required itemModel parameter.
  const UnSelectItem({required this.itemModel});

  /// Overriding props method to include itemModel for value comparison.
  @override
  List<Object> get props => [itemModel];
}

/// Event class for deleting a favourite item.
class DeleteFavouriteItem extends FavouriteEvent {}
