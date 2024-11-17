import 'dart:math';

import 'package:flutter/material.dart';
import 'package:main/ProfileScreen.dart';
import 'package:main/RecipeDetailScreen.dart';
import 'package:main/RecipeListScreen.dart';
import 'package:main/SearchOverlay.dart';
import 'package:main/data/dataRecipe.dart';


class HomeScreen extends StatelessWidget {
  // Data kategori
  final List<Map<String, String>> categories = [
    {'name': 'Ayam', 'image': 'images/categories/ayam.jpeg'},
    {'name': 'Pedas', 'image': 'images/categories/pedas.jpeg'},
    {'name': 'Bebek', 'image': 'images/categories/bebek.jpg'},
    {'name': 'Panggang', 'image': 'images/categories/panggang.jpeg'},
  ];

  // Daftar tips acak
  final List<String> tips = [
    "Pro Tip: Always use fresh ingredients for a more authentic taste!",
    "Pro Tip: Balance your flavors with a pinch of sugar or a dash of vinegar.",
    "Pro Tip: Toast your spices before cooking to release their aroma.",
    "Pro Tip: Don't overcrowd the pan to ensure even cooking.",
    "Pro Tip: Let your meat rest before cutting for juicier results.",
  ];

  // Fungsi untuk mendapatkan tips acak
  String getRandomTip() {
    final randomIndex = Random().nextInt(tips.length);
    return tips[randomIndex];
  }

  // Menampilkan overlay pencarian
  void _showSearchOverlay(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SearchOverlay()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Menyimpan tips acak untuk ditampilkan
    final randomTip = getRandomTip();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chinese Food",
          style: TextStyle(color: Colors.amberAccent[100]),
        ),
        backgroundColor: Colors.red[800],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.amberAccent[100]),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.amberAccent[100]),
            onPressed: () => _showSearchOverlay(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red[800]),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.amberAccent[100], fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text("Bookmark"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookmarkScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/resep/banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeListScreen(
                            category: category['name']!,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(category['image']!),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            category['name']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),

            // Popular Dishes Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Popular Dishes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: rList.map((recipe) {
                  return PopularDishCard(
                    title: recipe.name,
                    imagePath: recipe.imageAsset,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailScreen(
                            recipeId: recipe.id, // Menggunakan ID resep.
                          ),
                        ),
                      );
                    },
                  );
                  //menambahkan popular dish baru 
                }).toList(),
              ),
            ),

            // Tips of the Day Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Tips of the Day",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Text(
                randomTip,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Popular Dish Card
class PopularDishCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  PopularDishCard(
      {required this.title, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Menangani klik pada kartu
      child: Container(
        margin: EdgeInsets.all(8),
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: EdgeInsets.all(8),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
