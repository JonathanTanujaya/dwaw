// BookmarkScreen.dart
import 'package:flutter/material.dart';
import 'package:main/bookmark_manager.dart';
import 'package:main/data/dataRecipe.dart';
import 'package:main/RecipeDetailScreen.dart';
import 'package:main/models/recipe.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  List<String> bookmarkedRecipeIds = [];
  List<Recipe> bookmarkedRecipes = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarkedRecipes();
  }

  Future<void> _loadBookmarkedRecipes() async {
    bookmarkedRecipeIds = await BookmarkManager.getBookmarkedRecipes();
    bookmarkedRecipes = rList.where((recipe) => bookmarkedRecipeIds.contains(recipe.id)).toList();
    setState(() {});
  }

  Future<void> _removeBookmark(String recipeId) async {
    await BookmarkManager.removeBookmark(recipeId);
    _loadBookmarkedRecipes();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Resep dihapus dari bookmark'),
        duration: Duration(seconds: 2),
      ),
    );
  }

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
      body: bookmarkedRecipes.isEmpty
          ? Center(
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
            )
          : ListView.builder(
              itemCount: bookmarkedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = bookmarkedRecipes[index];
                return ListTile(
                  leading: Image.asset(
                    recipe.imageAsset,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(recipe.name),
                  subtitle: Text(recipe.description),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeBookmark(recipe.id),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecipeDetailScreen(recipeId: recipe.id)),
                    ).then((_) => _loadBookmarkedRecipes()); // Refresh setelah kembali
                  },
                );
              },
            ),
    );
  }
}
