import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Center(
        child: Column(
          children: [
            // Avatar user
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/avatar.png"), // Tambahkan gambar profil
            ),
            SizedBox(height: 10),
            // Tombol login/sign-up
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika login/sign-up
              },
              child: Text("Login / Sign Up"),
            ),
            // Bookmark resep favorit
            ListTile(
              title: Text("Bookmark"),
              leading: Icon(Icons.bookmark),
            ),
          ],
        ),
      ),
    );
  }
}
