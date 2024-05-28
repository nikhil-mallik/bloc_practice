import '../model/favourite_item_model.dart';

class FavouriteRepo {
  /// Asynchronous method to fetch a list of favourite items.
  Future<List<FavouriteItemModel>> fetchItem() async {
    // Simulate a delay of 1 second to mimic network request
    await Future.delayed(const Duration(seconds: 1));
    // Generate a list of favourite items
    return List.of(_generateList(10));
  }

  /// Method to generate a list of favourite items.
  List<FavouriteItemModel> _generateList(int length) {
    return List.generate(
      length,
          (index) =>
          FavouriteItemModel(id: index.toString(), value: 'Item: $index'),
    );
  }
}
