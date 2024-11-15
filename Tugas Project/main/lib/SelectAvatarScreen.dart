import 'package:flutter/material.dart';

class SelectAvatarScreen extends StatefulWidget {
  final String currentImage;

  SelectAvatarScreen({required this.currentImage});

  @override
  _SelectAvatarScreenState createState() => _SelectAvatarScreenState();
}

class _SelectAvatarScreenState extends State<SelectAvatarScreen> {
  String? _selectedImage;
  final List<String> _avatarOptions = [
    "images/avatar1.jpg",
    "images/avatar2.jpg",
    "images/avatar3.jpg",
    "images/avatar4.jpg",
    "images/avatar5.jpg",
    "images/avatar6.jpg",
    "images/avatar7.jpg",
    "images/avatar8.jpg",
    "images/avatar9.jpg",
    "images/avatar10.jpg",
  ];

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.currentImage; // Inisialisasi dengan gambar saat ini
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Avatar"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          // Kontainer gambar profil yang dipilih
          Container(
            color: Colors.red,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Center(
              child: Hero(
                tag: 'selected-avatar',
                child: CircleAvatar(
                  radius: 40, // Mengurangi ukuran radius avatar di container merah
                  backgroundImage: AssetImage(_selectedImage!),
                ),
              ),
            ),
          ),
          SizedBox(height: 30), // Tambahkan lebih banyak jarak antara container dan grid avatar
          
          // Daftar gambar avatar
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Mengurangi jumlah avatar per baris untuk ukuran yang lebih besar
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _avatarOptions.length,
              itemBuilder: (context, index) {
                final avatar = _avatarOptions[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedImage = avatar; // Pilih avatar yang ditekan
                    });
                  },
                  child: Stack(
                    children: [
                      Hero(
                        tag: avatar, // Tambahkan Hero tag yang unik
                        child: CircleAvatar(
                          radius: 40, // Memperbesar radius avatar di grid
                          backgroundImage: AssetImage(avatar),
                        ),
                      ),
                      if (_selectedImage == avatar)
                        Positioned(
                          right: 4,
                          bottom: 4,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 24,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          
          // Tombol "Batal" dan "Simpan"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Kembali tanpa perubahan
                  },
                  child: Text("Batal"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, _selectedImage); // Simpan pilihan
                  },
                  child: Text("Simpan"),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
