import 'package:flutter/material.dart';
import 'package:main/ProfileScreen.dart';
import 'package:main/SearchOverlay.dart';
import 'RecipeListScreen.dart'; // Layar untuk daftar resep berdasarkan kategori.

class HomeScreen extends StatelessWidget {
  // Data kategori
  final List<Map<String, String>> categories = [
    {'name': 'Ayam', 'image': 'images/categories/ayam.jpeg'},
    {'name': 'Pedas', 'image': 'images/categories/pedas.jpeg'},
    {'name': 'Bebek', 'image': 'images/categories/bebek.jpg'},
    {'name': 'Panggang', 'image': 'images/categories/panggang.jpeg'},
  ];

  // Menampilkan overlay pencarian
  void _showSearchOverlay(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SearchOverlay()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                children: [
                  PopularDishCard(
                    title: "Kung Pao Chicken",
                    imagePath: "images/resep/kung_pao_chicken.jpeg",
                  ),
                  PopularDishCard(
                    title: "Sweet and Sour Pork",
                    imagePath: "images/resep/sweet_sour_pork.jpeg",
                  ),
                  PopularDishCard(
                    title: "Peking Duck",
                    imagePath: "images/resep/peking_duck.jpg",
                  ),
                  PopularDishCard(
                    title: "Mapo Tofu",
                    imagePath: "images/resep/mapo_tofu.jpg",
                  ),
                ],
              ),
            ),

            // Additional Section: Tips of the Day
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
                "Pro Tip: Always use fresh ingredients for a more authentic taste!",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk kartu Popular Dish
class PopularDishCard extends StatelessWidget {
  final String title;
  final String imagePath;

  PopularDishCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
