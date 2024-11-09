import 'package:flutter/material.dart';
import 'SearchOverlay.dart';

class HomeScreen extends StatelessWidget {
  void _showSearchOverlay(BuildContext context) {
    Navigator.of(context).push(SearchOverlay());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => _showSearchOverlay(context), // Menampilkan search overlay
          ),
        ],
      ),
      body: Column(
        children: [
          // Kontainer kategori resep
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryCard(category: "Daging"),
                CategoryCard(category: "Ikan"),
                CategoryCard(category: "Sayuran"),
              ],
            ),
          ),
          // Tambahkan konten lainnya di bawah ini
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(category),
      ),
    );
  }
}
