import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  get auth => FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ยินดีต้อน"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(
                auth.currentUser.email,
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                child: Text("ออกจากระบบ"),
                onPressed: () {
                  auth.SignOut().then((value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
