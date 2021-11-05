import 'dart:io';
import 'package:finalpro/models/transaction.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
//ฐานข้อมูล
  String dbName;
  TransactionDB({required this.dbName});
  Future<Database> openDatabase() async {
    Directory? appDirectory = await getExternalStorageDirectory();
    String dbLocation = join(appDirectory!.path, dbName);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  // บันทึกข้อมูล
  Future<int> InsertData(statement) async {
    // ฐานข้อมูล => Store
    var db = await openDatabase();
    var store = intMapStoreFactory.store("expense");

    // // // json
    var keyID = store.add(db, {
      "vocabulary": statement.title1,
      "Translation": statement.title2,
      "Reading": statement.title3
    });
    db.close();
    return keyID;
  }

  loadAllData() async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db);
    List transactionList = <Transactions>[];
    // ignore: unused_local_variable
    for (var record in snapshot) {
      transactionList.add(Transactions(
        title1: record['vocabulary'].toString(),
        title2: record['Translation'].toString(),
        title3: record['Reading'].toString(),
      ));
    }
    return transactionList;
  }
}
