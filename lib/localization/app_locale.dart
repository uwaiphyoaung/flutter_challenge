mixin AppLocale {
  static const String loading = 'loading';
  static const String home = 'home';
  static const String language = 'language';
  static const String categories = 'categories';
  static const String connectionLost = 'connectionLost';
  static const String somethingWentWrong = 'somethingWentWrong';
  static const String tryAgain = 'tryAgain';
  static const String noCategory = 'noCategory';
  static const String noProduct = 'noProduct';

  static const Map<String, dynamic> EN = {
    loading: 'Loading ...',
    home: 'Home',
    language: 'Language',
    categories: 'Categories',
    connectionLost: 'Internet connection lost',
    somethingWentWrong: 'Something went wrong',
    tryAgain: 'Try Again',
    noCategory: 'No Category',
    noProduct: 'No Products'
  };
  static const Map<String, dynamic> TH = {
    loading: 'กำลังโหลด ...',
    home: 'บ้าน',
    language: 'ภาษา',
    categories: 'หมวดหมู่',
    connectionLost: 'การเชื่อมต่ออินเทอร์เน็ตขาดหาย',
    somethingWentWrong: 'บางอย่างผิดพลาด',
    tryAgain: 'ลองอีกครั้ง',
    noCategory: 'ไม่มีหมวดหมู่',
    noProduct: 'ไม่มีสินค้า'
  };
}