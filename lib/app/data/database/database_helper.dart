import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:yugiapp/app/data/model/cardsinfo_model.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
    } else {
      return _db;
    }
    return _db;
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'cardsdata.db');
    Database myDb = await openDatabase(path, onCreate: _onCreate, version: 1);
    return myDb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE cards(
      id INTEGER PRIMARY KEY,
      name TEXT,
      type TEXT,
      frameType TEXT,
      desc TEXT,
      atk INTEGER,
      def INTEGER,
      level INTEGER,
      race TEXT,
      attribute TEXT,
      cardSets TEXT,
      cardImages TEXT,
      cardPrices TEXT
    )
  ''',);
  }

   insertCard(CardsModel cardsModel) async {
    Database? myDb = _db;
    int response = await myDb!.insert("cards", cardsModel.toJson()); 

    return response ;
  }


Future<List<Map<String, dynamic>>> getAllCards() async {
    Database? myDb =  _db;
    List<Map<String, dynamic>> response = await myDb!.query("cards");
    return response ; 
  }
}

