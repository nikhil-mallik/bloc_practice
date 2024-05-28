import '../../utils/enums.dart';

/// A generic class representing the response from an API.
class ApiResponse<T> {
  LoginStatus? status; // The status of the response
  T? data; // The data returned by the API
  String? message; // Any message associated with the response

  /// Constructor for creating an ApiResponse instance.
  ApiResponse(this.status, this.data, this.message);

  /// Constructor for creating a loading ApiResponse instance.
  ApiResponse.loading() : status = LoginStatus.loading;

  /// Constructor for creating a completed ApiResponse instance.
  ApiResponse.completed(this.data) : status = LoginStatus.success;

  /// Constructor for creating an error ApiResponse instance.
  ApiResponse.error(this.message) : status = LoginStatus.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}
