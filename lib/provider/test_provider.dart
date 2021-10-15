import 'package:flutter/foundation.dart';
import 'package:home/database/data_db.dart';
import 'package:home/model/test.dart';

class Test_provider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void initData() async {
    var db = data_DB(dbName: "data.db");
    transactions = await db.loadAllData();
    notifyListeners();
  }

  void addTransaction(Transactions statement) async {
    var db = data_DB(dbName: "data.db");
    await db.InsertData(statement);

    transactions = await db.loadAllData();
    notifyListeners();
  }
}
