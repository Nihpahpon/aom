// ignore_for_file: avoid_print, unused_import

import 'package:finalpro/database/dataDb.dart';
import 'package:finalpro/models/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

class DataProvider with ChangeNotifier {
  var transactions = [];
  Future<List> getTransaction() async {
    return transactions;
  }

  void initData() async {
    var db = TransactionDB(dbName: "transactions.db");
    transactions = await db.loadAllData();
    notifyListeners();
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    await db.InsertData(statement);

    transactions = await db.loadAllData();
    //แจ้งเตือน
    notifyListeners();
  }
}
