import 'package:flutter/material.dart';
import 'package:home/Screens/Screens2.dart';
import 'package:home/Screens/home.dart';
import 'package:home/provider/test_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'model/test.dart';
import 'provider/test_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return Test_provider();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          scaffoldBackgroundColor: Colors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'My vocab'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: TabBarView(
          children: [Home(), Screens2()],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              text: "My vocab",
            ),
            Tab(
              text: "Add vocab",
            )
          ],
        ),
      ),
    );
  }
}
