import 'package:equatable/equatable.dart';

import '../../model/favourite_item_model.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> tempFavouriteItemList;
  final ListStatus listStatus;
  const FavouriteState({
    this.favouriteItemList = const [],
    this.tempFavouriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteState copyWith(
      {List<FavouriteItemModel>? favouriteItemList,
      ListStatus? listStatus,
      List<FavouriteItemModel>? tempFavouriteItemList}) {
    return FavouriteState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      tempFavouriteItemList:
          tempFavouriteItemList ?? this.tempFavouriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props =>
      [favouriteItemList, listStatus, tempFavouriteItemList];
}
