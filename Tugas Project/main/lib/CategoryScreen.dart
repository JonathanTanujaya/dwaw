import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kategori Resep")),
      body: Column(
        children: [
          // Search bar di bagian atas halaman
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari resep...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Kategori dengan jumlah resep
          ListTile(
            title: Text("Nasi Goreng"),
            trailing: Text("(10)"), // Menampilkan jumlah resep
          ),
          // Tambahkan kategori lainnya di sini
        ],
      ),
    );
  }
}
