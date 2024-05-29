import 'package:flutter/material.dart';

import '../../bloc/favourite_example/favourite_bloc.dart';
import '../views.dart';

// FavouriteScreen class which is a stateless widget to display the favourite items UI.
class FavouriteScreen extends StatelessWidget {
  // Constructor for FavouriteScreen, accepting a key.
  const FavouriteScreen({super.key});

  // Overriding the build method to define the UI of the FavouriteScreen.
  @override
  Widget build(BuildContext context) {
    // Adding the FetchFavouriteList event when the widget is built.
    context.read<FavouriteBloc>().add(FetchFavouriteList());

    return Scaffold(
      // AppBar with the title "Favourite App" and an action button.
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          // BlocBuilder to rebuild the UI based on the state of FavouriteBloc.
          BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              return Visibility(
                // Making the delete button visible only if there are items in the temporary list.
                visible: state.tempFavouriteItemList.isNotEmpty,
                child: IconButton(
                  onPressed: () {
                    // Adding the DeleteFavouriteItem event when the button is pressed.
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
      ), // Padding around the body content.
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          // BlocBuilder to rebuild the UI based on the state of FavouriteBloc.
          child: BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              switch (state.listStatus) {
                case ListStatus.loading:
                  // Displaying a loading indicator while the list is being fetched.
                  return const Center(child: CircularProgressIndicator());
                case ListStatus.failure:
                  // Displaying an error message if the list fetching fails.
                  return const Center(child: Text('Something went wrong'));
                case ListStatus.success:
                  // Displaying the list of favourite items when the list is successfully fetched.
                  return ListView.builder(
                    itemCount: state.favouriteItemList.length,
                    itemBuilder: (context, index) {
                      final item = state.favouriteItemList[index];
                      return Card(
                        child: ListTile(
                          // Checkbox to select or unselect items.
                          leading: Checkbox(
                            value: state.tempFavouriteItemList.contains(item),
                            onChanged: (val) {
                              if (val!) {
                                // Adding SelectItem event when an item is selected.
                                context
                                    .read<FavouriteBloc>()
                                    .add(SelectItem(itemModel: item));
                              } else {
                                // Adding UnSelectItem event when an item is unselected.
                                context
                                    .read<FavouriteBloc>()
                                    .add(UnSelectItem(itemModel: item));
                              }
                            },
                          ),
                          // Displaying the item's value.
                          title: Text(item.value.toString()),
                          // Button to toggle the favourite status of an item.
                          trailing: IconButton(
                            onPressed: () {
                              FavouriteItemModel favouriteItemModel =
                                  FavouriteItemModel(
                                      id: item.id,
                                      value: item.value,
                                      isFavourite: !item.isFavourite);
                              // Adding FavouriteItem event to update the item's favourite status.
                              context.read<FavouriteBloc>().add(
                                  FavouriteItem(itemModel: favouriteItemModel));
                            },
                            icon: Icon(
                              item.isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_outline_outlined,
                            ),
                          ),
                        ),
                      );
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
