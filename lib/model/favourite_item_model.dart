import 'package:equatable/equatable.dart';

/// Model representing a favorite item.
class FavouriteItemModel extends Equatable {
  final String id; // The ID of the favorite item
  final String value; // The value of the favorite item
  final bool isDeleting; // Flag indicating whether the item is being deleted
  final bool
      isFavourite; // Flag indicating whether the item is marked as a favorite

  /// Constructor for creating a FavouriteItemModel instance.
  const FavouriteItemModel({
    required this.id,
    required this.value,
    this.isDeleting = false, // Default value for isDeleting
    this.isFavourite = false, // Default value for isFavourite
  });

  /// Method for creating a copy of the FavouriteItemModel instance with some fields updated.
  FavouriteItemModel copyWith({
    String? id,
    String? value,
    bool? isDeleting,
    bool? isFavourite,
  }) {
    return FavouriteItemModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  List<Object?> get props => [id, value, isDeleting, isFavourite];
}
