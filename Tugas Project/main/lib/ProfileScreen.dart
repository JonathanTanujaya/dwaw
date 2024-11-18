import 'package:flutter/material.dart';
import 'package:main/SelectAvatarScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bookmark",
          style: TextStyle(color: Colors.amberAccent[100]),
        ),
        backgroundColor: Colors.red[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bookmark_outline, size: 100, color: Colors.red[300]),
            SizedBox(height: 10),
            Text(
              "Daftar Bookmark Kosong",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _profileImage = "images/avatar/defGam.jpg";
  String _userName = "User";
  String _themePreference = "Light Theme";

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _profileImage = prefs.getString('profileImage') ?? "images/avatar/defGam.jpg";
      _userName = prefs.getString('userName') ?? "User";
      _themePreference = prefs.getString('themePreference') ?? "Light Theme";
    });
  }

  Future<void> _saveProfileData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  void _changeTheme(String theme) {
    setState(() {
      _themePreference = theme;
    });
    _saveProfileData('themePreference', theme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
          style: TextStyle(color: Colors.amberAccent[100]),
        ),
        backgroundColor: Colors.red[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Profil
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red[800]!, Colors.orange[400]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final selectedImage = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectAvatarScreen(
                            currentImage: _profileImage,
                          ),
                        ),
                      );
                      if (selectedImage != null) {
                        setState(() {
                          _profileImage = selectedImage;
                        });
                        _saveProfileData('profileImage', selectedImage);
                      }
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(_profileImage),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[400],
                    ),
                    onPressed: () {
                      // Tambahkan logika login/sign-up di sini
                    },
                    child: Text("Login / Sign Up"),
                  ),
                ],
              ),
            ),
            // Tombol Tema
            ListTile(
              title: Text("Pengaturan Tema"),
              trailing: DropdownButton<String>(
                value: _themePreference,
                items: ["Light Theme", "Dark Theme", "Chinese Theme"]
                    .map((theme) => DropdownMenuItem(
                          value: theme,
                          child: Text(theme),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) _changeTheme(value);
                },
              ),
            ),
            // Tombol Bookmark
            ListTile(
              title: Text("Bookmark"),
              leading: Icon(Icons.bookmark, color: Colors.red[800]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookmarkScreen()),
                );
              },
            ),
            // Daftar Aktivitas
            ListTile(
              title: Text("Daftar Aktivitas"),
              subtitle: Text("- Membaca Resep: Kung Pao Chicken"),
              leading: Icon(Icons.restaurant, color: Colors.orange[400]),
            ),
            // Seksi Inspirasi Harian
            Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                color: Colors.amber[50],
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "\"Tahukah kamu? Dim sum artinya 'menyentuh hati' dalam bahasa Mandarin.\"",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.red[800],
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
