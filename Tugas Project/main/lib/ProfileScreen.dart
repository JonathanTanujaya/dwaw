import 'package:flutter/material.dart';
import 'package:main/SelectAvatarScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmark", style: TextStyle(color: Colors.amberAccent[100]),),
        backgroundColor: Colors.red[800], // Set app bar background color to red
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Text("Daftar Bookmark Kosong"),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _profileImage = "images/avatar/defGam.jpg"; // Gambar profil default

  @override
  void initState() {
    super.initState();
    _loadProfileImage(); // Muat gambar profil ketika halaman dimuat
  }

  // Fungsi untuk memuat gambar profil dari SharedPreferences
  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _profileImage = prefs.getString('profileImage') ?? "images/avatar/defGam.jpg";
    });
  }

  // Fungsi untuk menyimpan gambar profil ke SharedPreferences
  Future<void> _saveProfileImage(String newImage) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', newImage);
  }

  // Fungsi untuk mengupdate gambar profil
  void _updateProfileImage(String newImage) {
    setState(() {
      _profileImage = newImage;
    });
    _saveProfileImage(newImage); // Simpan gambar profil ke SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil", style: TextStyle(color: Colors.amberAccent[100])),
        backgroundColor: Colors.red[800],
      ),
      body: Column(
        children: [
          // Kontainer merah penuh lebar untuk avatar dan tombol login
          Container(
            color: Colors.red[800],
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BookmarkScreen()));
            },
          ),
        ],
      ),
    );
  }
}
