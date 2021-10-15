import 'package:flutter/material.dart';
import 'package:home/Screens/home.dart';
import 'package:home/main.dart';
import 'package:home/model/test.dart';
import 'package:home/provider/test_provider.dart';
import 'package:provider/provider.dart';

class Screens2 extends StatelessWidget {
  final title1Controller = TextEditingController(); // รับvocabulary
  final title2Controller = TextEditingController(); // รับTranslation
  final title3Controller = TextEditingController(); // รับReading
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add vocab"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "Vocabulary"),
                  autofocus: false,
                  controller: title1Controller,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "Translation"),
                  controller: title2Controller,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "Reading"),
                  controller: title3Controller,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    primary: Colors.black,
                    backgroundColor: Colors.orange,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    var title1 = title1Controller.text;
                    var title2 = title2Controller.text;
                    var title3 = title3Controller.text;

                    Transactions statement = Transactions(
                        title1: title1, title2: title2, title3: title3);
                    var provider =
                        Provider.of<Test_provider>(context, listen: false);
                    provider.addTransaction(statement);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) {
                              return MyHomePage(
                                title: 'My vocab',
                              );
                            }));
                  },
                  child: const Text("Add vocab"),
                )
              ],
            ),
          ),
        ));
  }
}
