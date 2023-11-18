import 'package:flutter_challenge/models/category_entity.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class CategoryDao{
  final dbProvider = DatabaseProvider.dbProvider;

  add(CategoryEntity data) async {
    final db = await dbProvider.database;
    db.insert(CategoryEntity.TABLE_NAME, data.toDatabaseJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteAll() async {
    var db = await dbProvider.database;
    db.delete(CategoryEntity.TABLE_NAME);
  }

  Future<List<CategoryEntity>> getAll() async {
    final db = await dbProvider.database;
    var allData = await db.query(CategoryEntity.TABLE_NAME, columns: [
      CategoryEntity.COLUMN_ID,
      CategoryEntity.COLUMN_NAME
    ]);

    List<CategoryEntity> datas = [];
    for (var productRecord in allData) {
      CategoryEntity data = CategoryEntity.fromJson(productRecord);
      datas.add(data);
    }
    return datas;
  }
}