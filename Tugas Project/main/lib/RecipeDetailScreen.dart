// RecipeDetailScreen.dart
import 'package:flutter/material.dart';
import 'package:main/data/dataRecipe.dart'; // Import file data resep.
import 'package:main/bookmark_manager.dart';
import 'package:main/models/recipe.dart'; // Import BookmarkManager.

class RecipeDetailScreen extends StatefulWidget {
  final String recipeId; // Menggunakan ID sebagai parameter utama.

  RecipeDetailScreen({required this.recipeId});

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late Recipe recipeData;
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _loadRecipe();
  }

  Future<void> _loadRecipe() async {
    // Mencari data berdasarkan ID
    recipeData = rList.firstWhere(
      (recipe) => recipe.id == widget.recipeId,
      orElse: () => throw Exception("Resep dengan ID ${widget.recipeId} tidak ditemukan."),
    );

    // Mengecek status bookmark
    isBookmarked = await BookmarkManager.isBookmarked(widget.recipeId);
    setState(() {});
  }

  Future<void> _toggleBookmark() async {
    if (isBookmarked) {
      await BookmarkManager.removeBookmark(widget.recipeId);
    } else {
      await BookmarkManager.addBookmark(widget.recipeId);
    }
    setState(() {
      isBookmarked = !isBookmarked;
    });

    // Menampilkan snackbar sebagai umpan balik
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isBookmarked ? 'Resep dibookmark' : 'Bookmark dihapus'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Pastikan data resep sudah dimuat
    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipeData.name,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.white,
            ),
            onPressed: _toggleBookmark,
          ),
        ],
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
