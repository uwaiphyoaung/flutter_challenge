import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_challenge/localization/app_locale.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:http/http.dart';

import 'api_response.dart';

class API {

  Client client = Client();

  Map<String, String> headers = {
    "Accept": "application/json",
    "content-type": "application/json"
  };

  Future<ApiResponse> get(String url, BuildContext context) async {
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
          // ignore: use_build_context_synchronously
          var errorMsg = AppLocale.somethingWentWrong.getString(context);
          return Fail(ApiError(errorMsg, response.statusCode));
      }
    } on SocketException {
      // ignore: use_build_context_synchronously
      return Fail(ApiError(AppLocale.connectionLost.getString(context), -1));
    } on Exception catch (e) {
      // ignore: use_build_context_synchronously
      return Fail(ApiError(AppLocale.somethingWentWrong.getString(context), -2));
    }
  }
}
