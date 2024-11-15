import 'package:flutter/material.dart';
import 'package:main/main.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Durasi splash screen menjadi 5 detik
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()), // Menuju MainScreen
      );
    });

    return Scaffold(
      backgroundColor: Colors.red[800], // Background merah
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tambahkan gambar ikon bertema Chinese food
            Icon(
              Icons.ramen_dining, // Icon dari material design
              color: Colors.white,
              size: 100,
            ),
            SizedBox(height: 20),
            // Teks loading dengan tema Chinese food
            Text(
              "Loading Chinese Food Recipes...",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Progress bar untuk animasi loading
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                color: Colors.yellow,
                backgroundColor: Colors.white,
                minHeight: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
