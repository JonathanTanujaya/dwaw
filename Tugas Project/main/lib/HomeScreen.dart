import 'package:flutter/material.dart';
import 'package:main/ProfileScreen.dart';
import 'package:main/SearchOverlay.dart';

class HomeScreen extends StatelessWidget {
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
              icon: Icon(Icons.menu, color: Colors.amberAccent[100],),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.amberAccent[100],),
            onPressed: () => _showSearchOverlay(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red[800],
              ),
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
              title: Text("Bookmark"),
              leading: Icon(Icons.bookmark),
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
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final categories = [
                    "Daging",
                    "Ikan",
                    "Sayuran",
                    "Mie",
                    "Dimsum"
                  ];
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}

// Widget for Popular Dish Card
class PopularDishCard extends StatelessWidget {
  final String title;
  final String imagePath;

  PopularDishCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
