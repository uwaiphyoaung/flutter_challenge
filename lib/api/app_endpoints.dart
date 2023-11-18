import '../constants/app.constant.dart';

class ApiEndPoint {
  static String BASE_URL = AppConstant.host;

  static String categories() => "$BASE_URL/products/categories";

  static String productsByCategory(String category) => "$BASE_URL/products/category/$category";
}
