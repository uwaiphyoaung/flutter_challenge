import 'package:flutter_challenge/models/category_entity.dart';
import 'package:flutter_challenge/models/product_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database? _database;

  Future<Database> get database async {
    _database ??= await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    var database = await openDatabase(join(dbPath, "flutter_challenge"),
        version: 1,
        onCreate: initDB,
        onUpgrade: onUpgrade,
        onDowngrade: onDatabaseDowngradeDelete);
    return database;
  }

  void onUpgrade(
    Database database,
    int oldVersion,
    int newVersion,
  ) {
    if (newVersion > oldVersion) {
      v2Changes(database);
    }
  }

  void initDB(Database database, int version) async {
    //Dropping tables
    await database.execute('DROP TABLE IF EXISTS ${CategoryEntity.TABLE_NAME}');
    await database.execute('DROP TABLE IF EXISTS ${ProductEntity.TABLE_NAME}');
    //create tables
    createTables(database);
  }

  void v2Changes(Database db) async {
    await db.execute('DROP TABLE IF EXISTS ${CategoryEntity.TABLE_NAME}');
    await db.execute('DROP TABLE IF EXISTS ${ProductEntity.TABLE_NAME}');
    createTables(db);
  }

  void createTables(Database database) async {
    await database.execute("CREATE TABLE IF NOT EXISTS ${ProductEntity.TABLE_NAME} ("
        "${ProductEntity.COLUMN_ID} INTEGER PRIMARY KEY,"
        "${ProductEntity.COLUMN_TITLE} TEXT,"
        "${ProductEntity.COLUMN_DESCRIPTION} TEXT,"
        "${ProductEntity.COLUMN_CATEGORY} TEXT,"
        "${ProductEntity.COLUMN_THUMBNAIL} TEXT"
        ")");
    await database.execute("CREATE TABLE IF NOT EXISTS ${CategoryEntity.TABLE_NAME} ("
        "${CategoryEntity.COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT,"
        "${CategoryEntity.COLUMN_NAME} TEXT"
        ")");
  }
}
