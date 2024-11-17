import 'package:flutter/material.dart';
import 'package:main/data/dataRecipe.dart';

import 'RecipeDetailScreen.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> searchResults = [];

  // Fungsi untuk mencari resep berdasarkan input pengguna
  void searchRecipe(String query) {
    List<String> results = rList
        .where((recipe) =>
            recipe.name.toLowerCase().contains(query.toLowerCase()))
        .map((recipe) => recipe.name)
        .toList();

    setState(() {
      searchResults = results;
    });
  }

  // Fungsi untuk mengelompokkan resep berdasarkan inisial
  Map<String, List<String>> groupRecipesByInitial() {
    Map<String, List<String>> groupedRecipes = {};

    for (var recipe in rList) {
      String initial = recipe.name[0].toUpperCase();
      if (groupedRecipes.containsKey(initial)) {
        groupedRecipes[initial]!.add(recipe.id);
      } else {
        groupedRecipes[initial] = [recipe.id];
      }
    }
    return groupedRecipes;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> groupedRecipes = groupRecipesByInitial();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daftar Isi Resep Masakan China",
          style: TextStyle(color: Colors.amberAccent[100]),
        ),
        backgroundColor: Colors.red[800],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: searchRecipe,
              decoration: InputDecoration(
                hintText: "Cari resep...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: searchResults.isNotEmpty
                ? ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      String recipeId = rList
                          .firstWhere((recipe) =>
                              recipe.name == searchResults[index])
                          .id;
                      return ListTile(
                        title: Text(searchResults[index]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeDetailScreen(
                                recipeId: recipeId, // Gunakan ID di sini
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                : ListView(
                    children: groupedRecipes.keys.map((key) {
                      return ExpansionTile(
                        title: Text(
                          key,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        children: groupedRecipes[key]!.map((id) {
                          final recipe = rList.firstWhere((recipe) => recipe.id == id);
                          return ListTile(
                            title: Text(recipe.name),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailScreen(
                                    recipeId: recipe.id, // Gunakan ID di sini
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
