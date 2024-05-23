import 'package:bloc/bloc.dart';

import '../../model/favourite_item_model.dart';
import '../../repository/favourite_repo.dart';
import 'favourite_event.dart';
import 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];
  FavouriteRepo favouriteRepo;

  FavouriteBloc(this.favouriteRepo) : super(const FavouriteState()) {
    on<FetchFavouriteList>(fetchFavouriteList);
    on<FavouriteItem>(_addFavouriteItems);
    on<SelectItem>(_selectItems);
    on<UnSelectItem>(_unSelectItems);
    on<DeleteFavouriteItem>(_deleteItems);
  }

  void fetchFavouriteList(
      FetchFavouriteList event, Emitter<FavouriteState> states) async {
    favouriteList = await favouriteRepo.fetchItem();
    states(state.copyWith(
      favouriteItemList: List.from(favouriteList),
      listStatus: ListStatus.success,
    ));
  }

  void _addFavouriteItems(
      FavouriteItem event, Emitter<FavouriteState> states) async {
    final index =
        favouriteList.indexWhere((test) => test.id == event.itemModel.id);

    if (event.itemModel.isFavourite) {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.itemModel);
      }
    } else {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.itemModel);
      }
    }

    favouriteList[index] = event.itemModel;

    states(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void _selectItems(SelectItem event, Emitter<FavouriteState> states) async {
    tempFavouriteList.add(event.itemModel);

    states(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void _unSelectItems(
      UnSelectItem event, Emitter<FavouriteState> states) async {
    tempFavouriteList.remove(event.itemModel);

    states(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void _deleteItems(
      DeleteFavouriteItem event, Emitter<FavouriteState> states) async {
    for (int i = 0; i < tempFavouriteList.length; i++) {
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear();
    states(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        tempFavouriteItemList: List.from(tempFavouriteList)));
  }
}
