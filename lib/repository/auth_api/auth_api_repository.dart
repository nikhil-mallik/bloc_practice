import '../../model/user/user_model.dart';

/// Abstract class defining methods for authentication API repositories.
abstract class AuthApiRepository {
  /// Asynchronous method to perform login API request.
  Future<UserModel> loginApi(dynamic data);
}
