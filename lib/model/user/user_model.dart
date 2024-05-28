import 'package:freezed_annotation/freezed_annotation.dart'; // Importing freezed_annotation package

part 'user_model.freezed.dart'; // Importing generated code for Freezed class
part 'user_model.g.dart'; // Importing generated code for JSON serialization

/// Freezed class representing a user model.
@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @Default('') String token, // User token, default value is an empty string
    @Default('')
    String error, // Error message, default value is an empty string
  }) = _UserModel;

  /// Factory constructor for creating a [UserModel] instance from JSON.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
