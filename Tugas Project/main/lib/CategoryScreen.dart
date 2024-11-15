import 'package:flutter/material.dart';
import 'RecipeDetailScreen.dart'; // Import halaman detail resep

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // Daftar kategori resep Chinese Food (contoh)
  final Map<String, List<String>> categories = {
    'A': ['Ayam Kung Pao', 'Ayam Hainan'],
    'B': ['Bebek Peking'],
    'C': ['Capcay', 'Chow Mein'],
    'D': ['Dimsum'],
    'M': ['Mapo Tofu'],
    'N': ['Nasi Goreng China'],
    'S': ['Sup Wantan', 'Spring Roll'],
  };

  // Variabel untuk menyimpan hasil pencarian
  List<String> searchResults = [];

  // Fungsi untuk mencari resep berdasarkan input pengguna
  void searchRecipe(String query) {
    List<String> results = [];
    categories.forEach((key, value) {
      results.addAll(value.where((recipe) => recipe.toLowerCase().contains(query.toLowerCase())));
    });

    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Isi", style: TextStyle(color: Colors.amberAccent[100])),
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
                      return ListTile(
                        title: Text(searchResults[index]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeDetailScreen(recipeName: searchResults[index]),
                            ),
                          );
                        },
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      String key = categories.keys.elementAt(index);
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ExpansionTile(
                          title: Text(
                            key,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          children: categories[key]!.map((recipe) {
                            return ListTile(
                              title: Text(recipe),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecipeDetailScreen(recipeName: recipe),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
