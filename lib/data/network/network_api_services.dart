import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../exception/app_exceptions.dart';
import 'base_api_services.dart';

/// Class for handling network API requests.
class NetworkApiService implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    // Print the URL if in debug mode
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      // Perform a GET request and set a timeout duration
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      // Process the response
      responseJson = returnResponse(response);
    } on SocketException {
      // Throw NoInternetException if there is no internet connection
      throw NoInternetException('');
    } on TimeoutException {
      // Throw FetchDataException if the network request times out
      throw FetchDataException('Network Request time out');
    }

    // Print the response if in debug mode
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    // Print the URL and data if in debug mode
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      // Perform a POST request and set a timeout duration
      final Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      // Process the response
      responseJson = returnResponse(response);
    } on SocketException {
      // Throw NoInternetException if there is no internet connection
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      // Throw FetchDataException if the network request times out
      throw FetchDataException('Network Request time out');
    }

    // Print the response if in debug mode
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  // Process the HTTP response
  dynamic returnResponse(http.Response response) {
    // Print the HTTP status code if in debug mode
    if (kDebugMode) {
      print(response.statusCode);
    }

    // Handle different HTTP status codes
    switch (response.statusCode) {
      case 200:
        // Decode and return the response body for a successful request
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        // Decode and return the response body for a bad request
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        // Throw BadRequestException for an unauthorized request
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        // Throw UnauthorisedException for a server error or not found
        throw UnauthorisedException(response.body.toString());
      default:
        // Throw FetchDataException for other HTTP status codes
        throw FetchDataException(
            'Error occurred while communicating with server');
    }
  }
}
