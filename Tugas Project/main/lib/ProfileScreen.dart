import 'package:flutter/material.dart';
import 'package:main/SelectAvatarScreen.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _profileImage = "images/defGam.jpg"; // Gambar profil default

  // Fungsi untuk mengupdate gambar profil
  void _updateProfileImage(String newImage) {
    setState(() {
      _profileImage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Column(
        children: [
          // Kontainer merah penuh lebar untuk avatar dan tombol login
          Container(
            color: Colors.red,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Avatar pengguna
                GestureDetector(
                  onTap: () async {
                    // Navigasi ke SelectAvatarScreen dan menunggu hasil
                    final selectedImage = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectAvatarScreen(
                          currentImage: _profileImage,
                        ),
                      ),
                    );

                    // Jika pengguna memilih untuk menyimpan gambar baru
                    if (selectedImage != null) {
                      _updateProfileImage(selectedImage);
                    }
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(_profileImage),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika login/sign-up di sini
                  },
                  child: Text("Login / Sign Up"),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Bookmark button (dapat disesuaikan sesuai kebutuhan)
          ListTile(
            title: Text("Bookmark"),
            leading: Icon(Icons.bookmark),
          ),
        ],
      ),
    );
  }
}
