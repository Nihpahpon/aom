import 'package:flutter/material.dart';
import 'package:tasssssst/screen/login.dart';
import 'package:tasssssst/screen/register.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resister/Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Image.asset(
            'images/2.png',
            width: 600,
            height: 400,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text("สร้างบัญชีผู้ใช้", style: TextStyle(fontSize: 15)),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Register();
                }));
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: Icon(Icons.login),
              label: Text("เข้าสู่ระบบ", style: TextStyle(fontSize: 15)),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              },
            ),
          )
        ]),
      ),
    );
  }
}
