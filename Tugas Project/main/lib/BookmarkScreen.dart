import 'package:flutter/material.dart';
import 'package:main/bookmark_manager.dart';
import 'package:main/RecipeDetailScreen.dart';
import 'package:main/models/recipe.dart';
import 'package:main/data/dataRecipe.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  List<Recipe> bookmarkedRecipes = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarkedRecipes();
  }

  Future<void> _loadBookmarkedRecipes() async {
    List<String> bookmarkedRecipeIds =
        await BookmarkManager.getBookmarkedRecipes();
    setState(() {
      bookmarkedRecipes = rList
          .where((recipe) => bookmarkedRecipeIds.contains(recipe.id))
          .toList();
    });
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
        title: Text("Bookmark"),
        backgroundColor: Colors.redAccent,
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
                  Icon(Icons.bookmark_outline, size: 100, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    "Belum ada resep yang di-bookmark",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: bookmarkedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = bookmarkedRecipes[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: ListTile(
                    leading: Image.asset(
                      recipe.imageAsset,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(recipe.name),
                    subtitle: Text(recipe.description),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeBookmark(recipe.id),
                    ),
                    onTap: () async {
                      // Navigasi ke RecipeDetailScreen
                      bool? updated = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailScreen(recipeId: recipe.id),
                        ),
                      );

                      // Perbarui data jika ada perubahan
                      if (updated == true) {
                        _loadBookmarkedRecipes();
                      }
                    },
                  ),
                );
              },
            ),
    );
  }
}
