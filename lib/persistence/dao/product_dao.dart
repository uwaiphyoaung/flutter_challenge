import 'package:flutter_challenge/models/product_entity.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class ProductDao{
  final dbProvider = DatabaseProvider.dbProvider;

  add(ProductEntity data) async {
    final db = await dbProvider.database;
    db.insert(ProductEntity.TABLE_NAME, data.toDatabaseJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteByCategory(String type) async {
    var db = await dbProvider.database;
    db.delete(ProductEntity.TABLE_NAME, where: '${ProductEntity.COLUMN_CATEGORY} = ?', whereArgs: [type]);
  }

  deleteAll() async {
    var db = await dbProvider.database;
    db.delete(ProductEntity.TABLE_NAME);
  }

  Future<List<ProductEntity>> getProductsByCategory(String type) async {
    final db = await dbProvider.database;
    var allProductsRecord = await db.query(ProductEntity.TABLE_NAME, columns: [
      ProductEntity.COLUMN_ID,
      ProductEntity.COLUMN_TITLE,
      ProductEntity.COLUMN_DESCRIPTION,
      ProductEntity.COLUMN_THUMBNAIL,
      ProductEntity.COLUMN_CATEGORY,
    ], where: '${ProductEntity.COLUMN_CATEGORY} = ?', whereArgs: [type]);

    List<ProductEntity> datas = [];
    allProductsRecord.forEach((productRecord) {
      ProductEntity data = ProductEntity.fromJson(productRecord);
      datas.add(data);
    });
    return datas;
  }
}