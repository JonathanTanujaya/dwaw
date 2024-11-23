import 'package:flutter/material.dart';
import 'package:main/data/dataRecipe.dart'; // Import data resep.
import 'RecipeDetailScreen.dart'; // Layar detail resep.


class RecipeListScreen extends StatelessWidget {
  final String category;

  RecipeListScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    // Filter resep berdasarkan kategori.
    final filteredRecipes = rList.where((recipe) => recipe.category.contains(category)).toList();


    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: TextStyle(color: Colors.amberAccent[100]),
        ),
        iconTheme: IconThemeData(color: Colors.amberAccent[800]),
        backgroundColor: Colors.red[800],
      ),
      body: filteredRecipes.isNotEmpty
          ? ListView.builder(
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = filteredRecipes[index];
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke layar detail menggunakan ID resep.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(
                          recipeId: recipe.id, // Gunakan `id` alih-alih index.
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    elevation: 4,
                    child: ListTile(
                      leading: recipe.imageAsset.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                recipe.imageAsset,
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.red[200],
                              child: Icon(Icons.fastfood, color: Colors.white),
                            ),
                      title: Text(recipe.name),
                      subtitle: Text(recipe.description.isNotEmpty
                          ? recipe.description
                          : "Tidak ada deskripsi tersedia."),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.red[800]),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                "Tidak ada resep dalam kategori ini.",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
    );
  }
}
