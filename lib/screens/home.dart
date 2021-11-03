// ignore_for_file: camel_case_types

import 'package:finalpro/models/transaction.dart';
import 'package:finalpro/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Home_sc extends StatefulWidget {
  const Home_sc({Key? key}) : super(key: key);

  @override
  _Home_scState createState() => _Home_scState();
}

class _Home_scState extends State<Home_sc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My vocab"),
          actions: [
            IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  SystemNavigator.pop();
                })
          ],
        ),
        body: Consumer(
          builder: (context, DataProvider provider, child) {
            var count = provider.transactions.length;
            if (count <= 0) {
              return const Center(
                child: Text(
                  "ไม่พบข้อมูล",
                  style: TextStyle(fontSize: 35),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: count,
                  itemBuilder: (context, int index) {
                    Transactions data = provider.transactions[index];
                    return Card(
                      elevation: 3,
                      color: const Color.fromARGB(255, 255, 165, 0),
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.orange[400],
                          foregroundColor: Colors.black,
                          child: FittedBox(
                            child: Text(data.title1),
                          ),
                        ),
                        title: Text(data.title2),
                        subtitle: Text(data.title3),
                      ),
                    );
                  });
            }
          },
        ));
  }
}
