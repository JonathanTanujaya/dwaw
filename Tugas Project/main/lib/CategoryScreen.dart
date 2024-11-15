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
  Map<String, List<int>> groupRecipesByInitial() {
    Map<String, List<int>> groupedRecipes = {};

    for (int i = 0; i < rList.length; i++) {
      String initial = rList[i].name[0].toUpperCase();
      if (groupedRecipes.containsKey(initial)) {
        groupedRecipes[initial]!.add(i);
      } else {
        groupedRecipes[initial] = [i];
      }
    }
    return groupedRecipes;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<int>> groupedRecipes = groupRecipesByInitial();

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
                      int recipeIndex = rList.indexWhere(
                          (recipe) => recipe.name == searchResults[index]);
                      return ListTile(
                        title: Text(searchResults[index]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeDetailScreen(
                                recipeIndex: recipeIndex,
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
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        children: groupedRecipes[key]!.map((index) {
                          return ListTile(
                            title: Text(rList[index].name),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailScreen(
                                    recipeIndex: index,
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
