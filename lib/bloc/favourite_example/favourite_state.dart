part of 'favourite_bloc.dart';

// FavouriteState class that extends Equatable to ensure value equality.
class FavouriteState extends Equatable {
  // List to hold favourite items.
  final List<FavouriteItemModel> favouriteItemList;

  // Temporary list to hold favourite items.
  final List<FavouriteItemModel> tempFavouriteItemList;

  // Status of the list operation.
  final ListStatus listStatus;

  // Constructor for FavouriteState with default values.
  const FavouriteState({
    this.favouriteItemList = const [],
    this.tempFavouriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  // Method to create a copy of the current state with updated values.
  FavouriteState copyWith({
    List<FavouriteItemModel>? favouriteItemList,
    ListStatus? listStatus,
    List<FavouriteItemModel>? tempFavouriteItemList,
  }) {
    return FavouriteState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      tempFavouriteItemList:
          tempFavouriteItemList ?? this.tempFavouriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  // Overriding props method to include properties for value comparison.
  @override
  List<Object?> get props => [
        favouriteItemList,
        tempFavouriteItemList,
        listStatus,
      ];
}
