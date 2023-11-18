import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'api_response.dart';

class API {

  Client client = Client();

  Map<String, String> headers = {
    "Accept": "application/json",
    "content-type": "application/json"
  };

  Future<ApiResponse> get(String url) async {
    if (kDebugMode) {
      print("calling -> $url");
    }
    try {
      var response = await client.get(
          Uri.parse(url),
          headers: headers);
      if (kDebugMode) {
        print(
            "response for these API $url -> ${json.decode(utf8.decode(response.bodyBytes))}");
      }
      switch (response.statusCode) {
        case 200:
          return Success(response.body);
        default:
          return Fail(ApiError("Something went wrong", response.statusCode));
      }
    } on SocketException {
      return Fail(ApiError("Internet Connection Lost", -1));
    } on Exception catch (e) {
      return Fail(ApiError("Something went wrong", -2));
    }
  }
}
