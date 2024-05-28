import '../../model/user/user_model.dart'; // Importing the user model
import 'auth_api_repository.dart'; // Importing the authentication API repository

/// Mock implementation of [AuthApiRepository] for simulating login requests.
class AuthMockApiRepository implements AuthApiRepository {
  @override
  Future<UserModel> loginApi(dynamic data) async {
    // Simulate a delay to mimic network latency
    await Future.delayed(const Duration(seconds: 2));
    // Mock response data
    var responseData = {'token': 'a23z345xert'}; // Mock token data
    return UserModel.fromJson(
        responseData); // Parsing the mock response into a UserModel object
  }
}
