import 'package:flutter_challenge/api/api_response.dart';
import 'package:flutter_challenge/api/app_api.dart';
import 'package:flutter_challenge/api/app_endpoints.dart';

class HomeServices{
  API api = API();

  Future<ApiResponse> loadCategory() async =>
      api.get(ApiEndPoint.categories());

  Future<ApiResponse> productsByCategory(String data) async =>
      api.get(ApiEndPoint.productsByCategory(data));

}