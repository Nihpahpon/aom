import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:home/model/test.dart';
import 'package:path/path.dart';

class data_DB {
  late String dbName;
  data_DB({required this.dbName});

  get intMapStoreFactory => null;

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicatinDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    DatabaseFactory dbFacctory = (await data_DB) as DatabaseFactory;
    Database db = await dbFacctory.openDatabase(dbLocation);
    return db;
  }

  getApplicatinDocumentsDirectory() {}
  Future<int> InsertData(Transactions statement) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var keyID = store.add(db, {
      "vocabulary": statement.title1,
      "Translation": statement.title1,
      "Reading": statement.title1
    });
    db.close();
    return keyID;
  }

  Future<List<Transactions>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db,
        finder: Finder(SortOrders: [SortOrder(Field.key, false)]));
    List transactionList = <Transactions>[];
    for (var record in snapshot) {
      transactionList.add(Transactions(
          title1: record["title1"],
          title2: record["title2"],
          title3: record["title3"]));
    }
    return transactionList;
  }

  ransactions({title1, title2, title3}) {}

  Finder({required List SortOrders}) {}

  SortOrder(key, bool bool) {}
}

class Field {
  static var key;
}

mixin transactions {
  get title1 => null;
  get title2 => null;
  get title3 => null;
}

class DatabaseFactory {
  openDatabase(String dbLocation) {}
}

class Database {
  void close() {}
}
