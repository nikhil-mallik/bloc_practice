/// Abstract class for defining base API services.
abstract class BaseApiServices {
  /// Method for making a GET request to the API.
  Future<dynamic> getApi(String url);

  /// Method for making a POST request to the API.
  Future<dynamic> postApi(String url, dynamic data);
}
