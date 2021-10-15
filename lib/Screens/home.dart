import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home/model/test.dart';
import 'package:home/provider/test_provider.dart';
import 'package:provider/provider.dart';

import 'Screens2.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<Test_provider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My vocab"),
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  SystemNavigator.pop();
                })
          ],
        ),
        body: Consumer(
          builder: (context, Test_provider provider, child) {
            var count = provider.transactions.length;
            if (count <= 0) {
              return Center(
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
                      //color: Color.orang,
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          radius: 30,
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
