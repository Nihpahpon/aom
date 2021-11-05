import 'package:finalpro/provider/data_provider.dart';
import 'package:finalpro/screens/home.dart';
import 'package:finalpro/screens/screens2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return DataProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 240, 230, 140),
          primarySwatch: Colors.orange,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'My vocab '),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.orange[400],
        body: TabBarView(
          children: [const Home_sc(), Screen2()],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(
              text: "My voab",
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
