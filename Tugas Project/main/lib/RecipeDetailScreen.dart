import 'package:flutter/material.dart';
import 'package:main/data/dataRecipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final int recipeIndex;

  RecipeDetailScreen({required this.recipeIndex});

  @override
  Widget build(BuildContext context) {
    // Cari resep berdasarkan indeks
    final recipeData = rList[recipeIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipeData.name,
          style: TextStyle(color: Colors.amberAccent[100]),
        ),
        iconTheme: IconThemeData(
          color: Colors.amberAccent[800], // Warna ikon back
        ),
        backgroundColor: Colors.red[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Resep
            if (recipeData.imageAsset.isNotEmpty)
              Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    recipeData.imageAsset,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ),

            // Deskripsi
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                recipeData.description,
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            ),

            // Alat dan Bahan
            if (recipeData.alat.isNotEmpty || recipeData.bahan.isNotEmpty)
              _buildSectionTitle('Alat & Bahan'),
            if (recipeData.alat.isNotEmpty || recipeData.bahan.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    ...recipeData.alat
                        .map((alat) => _buildChip(alat, Colors.red)),
                    ...recipeData.bahan
                        .map((bahan) => _buildChip(bahan, Colors.green)),
                  ],
                ),
              ),

            // Langkah-langkah
            if (recipeData.langkahlangkah.isNotEmpty)
              _buildSectionTitle('Langkah-Langkah'),
            ...recipeData.langkahlangkah.asMap().entries.map((entry) {
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                elevation: 4,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Text(
                      '${entry.key + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(entry.value),
                  subtitle: Text('Langkah ${entry.key + 1}'),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan judul section
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Fungsi untuk membuat chip
  Widget _buildChip(String text, Color color) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    );
  }
}
