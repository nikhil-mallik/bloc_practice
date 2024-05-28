import '../../data/network/base_api_services.dart'; // Importing the base API services
import '../../data/network/network_api_services.dart'; // Importing the network API services
import '../../model/user/user_model.dart'; // Importing the user model
import '../../utils/app_url.dart'; // Importing the URL configuration
import 'auth_api_repository.dart'; // Importing the authentication API repository

/// Implementation of [AuthApiRepository] for making HTTP requests to the authentication API.
class AuthHttpApiRepository implements AuthApiRepository {
  final BaseApiServices _apiServices =
      NetworkApiService(); // Initializing the API services

  @override
  Future<UserModel> loginApi(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.loginEndPint,
        data); // Making a POST request to the login endpoint
    return UserModel.fromJson(
        response); // Parsing the response into a UserModel object
  }
}
