import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final String recipeName;

  RecipeDetailScreen({required this.recipeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeName, style: TextStyle(color: Colors.amberAccent[100])),
        backgroundColor: Colors.red[800],
      ),
      body: Center(
        child: Text(
          'Detail resep untuk $recipeName',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
