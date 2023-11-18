class CategoryEntity {

  static const String TABLE_NAME = "category_table";
  static const String COLUMN_ID = "id";
  static const String COLUMN_NAME = "name";

  late final String name;

  CategoryEntity(this.name);

  CategoryEntity.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }

  Map<String, dynamic> toDatabaseJson() {
    final data = <String, dynamic>{};
    data[COLUMN_NAME] = name;
    return data;
  }

}