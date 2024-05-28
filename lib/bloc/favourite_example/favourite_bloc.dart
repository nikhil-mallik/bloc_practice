import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/favourite_item_model.dart';
import '../../repository/favourite_repo.dart';
import '../../utils/enums.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

// FavouriteBloc class which extends Bloc to handle FavouriteEvent and FavouriteState.
class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  // List to hold the favourite items.
  List<FavouriteItemModel> favouriteList = [];

  // Temporary list to hold selected favourite items.
  List<FavouriteItemModel> tempFavouriteList = [];

  // Repository to fetch favourite items.
  FavouriteRepo favouriteRepo;

  // Constructor for FavouriteBloc, initializing with the favourite repository.
  FavouriteBloc(this.favouriteRepo) : super(const FavouriteState()) {
    // Registering the event handlers.
    on<FetchFavouriteList>(fetchFavouriteList);
    on<FavouriteItem>(_addFavouriteItems);
    on<SelectItem>(_selectItems);
    on<UnSelectItem>(_unSelectItems);
    on<DeleteFavouriteItem>(_deleteItems);
  }

  // Handler for fetching the favourite list.
  void fetchFavouriteList(
      FetchFavouriteList event, Emitter<FavouriteState> states) async {
    favouriteList = await favouriteRepo.fetchItem();
    states(state.copyWith(
      favouriteItemList: List.from(favouriteList),
      listStatus: ListStatus.success,
    ));
  }

  // Handler for adding favourite items.
  void _addFavouriteItems(
      FavouriteItem event, Emitter<FavouriteState> states) async {
    final index =
        favouriteList.indexWhere((item) => item.id == event.itemModel.id);

    // Update the temporary list based on the favourite status.
    if (event.itemModel.isFavourite) {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
      }
      tempFavouriteList.add(event.itemModel);
    } else {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
      }
      tempFavouriteList.add(event.itemModel);
    }

    // Update the favourite list with the new item model.
    favouriteList[index] = event.itemModel;

    // Emit the new state with updated lists.
    states(state.copyWith(
      favouriteItemList: List.from(favouriteList),
      tempFavouriteItemList: List.from(tempFavouriteList),
    ));
  }

  // Handler for selecting items.
  void _selectItems(SelectItem event, Emitter<FavouriteState> states) async {
    // Add the selected item to the temporary list.
    tempFavouriteList.add(event.itemModel);

    // Emit the new state with the updated temporary list.
    states(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  // Handler for unselecting items.
  void _unSelectItems(
      UnSelectItem event, Emitter<FavouriteState> states) async {
    // Remove the unselected item from the temporary list.
    tempFavouriteList.remove(event.itemModel);

    // Emit the new state with the updated temporary list.
    states(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  // Handler for deleting favourite items.
  void _deleteItems(
      DeleteFavouriteItem event, Emitter<FavouriteState> states) async {
    // Remove all items in the temporary list from the favourite list.
    for (int i = 0; i < tempFavouriteList.length; i++) {
      favouriteList.remove(tempFavouriteList[i]);
    }

    // Clear the temporary list.
    tempFavouriteList.clear();

    // Emit the new state with updated lists.
    states(state.copyWith(
      favouriteItemList: List.from(favouriteList),
      tempFavouriteItemList: List.from(tempFavouriteList),
    ));
  }
}
