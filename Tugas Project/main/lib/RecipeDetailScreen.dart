import 'package:flutter/material.dart';
import 'package:main/data/dataRecipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final int recipeIndex;

  RecipeDetailScreen({required this.recipeIndex});

  @override
  Widget build(BuildContext context) {
    final recipeData = rList[recipeIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipeData.name,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Resep
              if (recipeData.imageAsset.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    recipeData.imageAsset,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),

              // Nama dan Deskripsi
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  recipeData.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),

              // Alat dan Bahan
              if (recipeData.alat.isNotEmpty || recipeData.bahan.isNotEmpty) ...[
                _buildSectionTitle('Alat'),
                _buildList(recipeData.alat),
                _buildSectionTitle('Bahan'),
                _buildList(recipeData.bahan),
              ],

              // Langkah-langkah
              if (recipeData.langkahlangkah.isNotEmpty) ...[
                _buildSectionTitle('Langkah-Langkah'),
                _buildStepList(recipeData.langkahlangkah),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan judul section
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Fungsi untuk membuat daftar alat/bahan
  Widget _buildList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    const Icon(Icons.check, size: 18, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(child: Text(item)),
                  ],
                ),
              ))
          .toList(),
    );
  }

  // Fungsi untuk langkah-langkah
  Widget _buildStepList(List<String> steps) {
    return Column(
      children: steps.asMap().entries.map((entry) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(
                '${entry.key + 1}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(entry.value),
          ),
        );
      }).toList(),
    );
  }
}
