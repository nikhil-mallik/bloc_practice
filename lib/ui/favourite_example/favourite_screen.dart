import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/favourite_example/favourite_bloc.dart';
import '../../bloc/favourite_example/favourite_event.dart';
import '../../bloc/favourite_example/favourite_state.dart';
import '../../model/favourite_item_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavouriteBloc>().add(FetchFavouriteList());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempFavouriteItemList.isNotEmpty ? true : false,
                child: IconButton(
                  onPressed: () {
                    context.read<FavouriteBloc>().add(DeleteFavouriteItem());
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case ListStatus.failure:
                return const Center(child: Text('Something went wrong'));
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItemList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: state.tempFavouriteItemList.contains(item)
                              ? true
                              : false,
                          onChanged: (val) {
                            if (val!) {
                              context
                                  .read<FavouriteBloc>()
                                  .add(SelectItem(itemModel: item));
                            } else {
                              context
                                  .read<FavouriteBloc>()
                                  .add(UnSelectItem(itemModel: item));
                            }
                          },
                        ),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            FavouriteItemModel favouriteItemModel =
                                FavouriteItemModel(
                                    id: item.id,
                                    value: item.value,
                                    isFavourite:
                                        item.isFavourite ? false : true);
                            context.read<FavouriteBloc>().add(
                                  FavouriteItem(itemModel: favouriteItemModel),
                                );
                          },
                          icon: Icon(item.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_outline_outlined),
                        ),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
