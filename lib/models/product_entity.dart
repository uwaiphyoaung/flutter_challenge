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
}