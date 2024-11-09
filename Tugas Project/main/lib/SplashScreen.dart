import 'package:flutter/material.dart';
import 'package:main/main.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()), // Menuju MainScreen
      );
    });


    return Scaffold(
      body: Center(
        child: Text(
          "Loading...", // Kamu bisa menggantinya dengan animasi
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
