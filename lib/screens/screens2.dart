import 'package:finalpro/main.dart';
import 'package:finalpro/models/transaction.dart';
import 'package:finalpro/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class Screen2 extends StatelessWidget {
  final title1Controller = TextEditingController(); //vocabulary
  final title2Controller = TextEditingController(); //  Translation
  final title3Controller = TextEditingController(); //  Reading
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add vocab"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Vocabulary"),
                    autofocus: false,
                    controller: title1Controller,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Translation"),
                    controller: title2Controller,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Reading"),
                    controller: title3Controller,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      primary: Colors.black,
                      backgroundColor: Colors.orange,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text("Add vocab"),
                    onPressed: () {
                      var title1 = title1Controller.text;
                      var title2 = title2Controller.text;
                      var title3 = title3Controller.text;
                      //เตรียมข้อมูล
                      Transactions statement = Transactions(
                        title1: title1,
                        title2: title2,
                        title3: title3,
                      );
                      //เรียกprovider
                      var provider =
                          Provider.of<DataProvider>(context, listen: false);
                      provider.addTransaction(statement);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) {
                                return const MyHomePage(
                                  title: '',
                                );
                              }));
                    },
                  )
                ],
              ),
            )));
  }
}
