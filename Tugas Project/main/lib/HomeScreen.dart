import 'package:flutter/material.dart';
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
        title: Text("Chinese Food"),
        backgroundColor: Colors.red,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
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
                color: Colors.red,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
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
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () {
                Navigator.pop(context);
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
                  image: AssetImage('images/chinese_food_banner.jpg'),
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
                  final categories = ["Daging", "Ikan", "Sayuran", "Mie", "Dimsum"];
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
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                    imagePath: "images/kung_pao_chicken.jpg",
                  ),
                  PopularDishCard(
                    title: "Sweet and Sour Pork",
                    imagePath: "images/sweet_sour_pork.jpg",
                  ),
                  PopularDishCard(
                    title: "Peking Duck",
                    imagePath: "images/peking_duck.jpg",
                  ),
                  PopularDishCard(
                    title: "Mapo Tofu",
                    imagePath: "images/mapo_tofu.jpg",
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
