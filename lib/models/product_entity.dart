class ProductList{
  List<ProductEntity>? products;
  int? total;
  int? skip;
  int? limit;

  ProductList.fromJson(Map<String, dynamic> json){
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
    if(json['products'] != null){
      products = List.from(json['products']).map((e)=>ProductEntity.fromJson(e)).toList();
    }
  }
}

class ProductEntity{

  static const String TABLE_NAME = "product_table";
  static const String COLUMN_ID = "id";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_DESCRIPTION = "description";
  static const String COLUMN_THUMBNAIL = "thumbnail";
  static const String COLUMN_CATEGORY = "category";

  int? id;
  String? title;
  String? description;
  dynamic price;
  dynamic discountPercentage;
  dynamic rating;
  dynamic stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  ProductEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    if(json['images'] != null){
      images = json['images'].cast<String>();
    }
  }

  Map<String, dynamic> toDatabaseJson() {
    final data = <String, dynamic>{};
    data[COLUMN_ID] = id;
    data[COLUMN_TITLE] = title;
    data[COLUMN_DESCRIPTION] = description;
    data[COLUMN_THUMBNAIL] = thumbnail;
    data[COLUMN_CATEGORY] = category;
    return data;
  }
}