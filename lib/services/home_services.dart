import 'package:flutter/cupertino.dart';
import 'package:flutter_challenge/api/api_response.dart';
import 'package:flutter_challenge/api/app_api.dart';
import 'package:flutter_challenge/api/app_endpoints.dart';

class HomeServices{
  API api = API();

  Future<ApiResponse> loadCategory(BuildContext context) async =>
      api.get(ApiEndPoint.categories(),context);

  Future<ApiResponse> productsByCategory(String data, BuildContext context) async =>
      api.get(ApiEndPoint.productsByCategory(data),context);

}