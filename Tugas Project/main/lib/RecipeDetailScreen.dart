import 'package:flutter/material.dart';
import 'package:main/data/dataRecipe.dart';
import 'package:main/bookmark_manager.dart';
import 'package:main/models/recipe.dart';

class RecipeDetailScreen extends StatefulWidget {
  final String recipeId;

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
      orElse: () => throw Exception(
          "Resep dengan ID ${widget.recipeId} tidak ditemukan."),
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

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isBookmarked
              ? 'Resep ditambahkan ke bookmark'
              : 'Resep dihapus dari bookmark',
        ),
        duration: Duration(seconds: 2),
      ),
    );

    // Kirimkan status pembaruan ke halaman sebelumnya
    Navigator.pop(context, true); // Memberitahu bahwa ada pembaruan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeData.name),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  recipeData.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              _buildSectionTitle('Alat'),
              _buildList(recipeData.alat),
              _buildSectionTitle('Bahan'),
              _buildList(recipeData.bahan),
              _buildSectionTitle('Langkah-Langkah'),
              _buildStepList(recipeData.langkahlangkah),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildList(List<String> items) {
    return Column(
      children: items.map((item) {
        return Row(
          children: [
            const Icon(Icons.check, color: Colors.green),
            const SizedBox(width: 8),
            Text(item),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildStepList(List<String> steps) {
    return Column(
      children: steps.asMap().entries.map((entry) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${entry.key + 1}'),
            ),
            title: Text(entry.value),
          ),
        );
      }).toList(),
    );
  }
}
