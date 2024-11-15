import 'package:flutter/material.dart';

class SearchOverlay extends StatefulWidget {
  @override
  _SearchOverlayState createState() => _SearchOverlayState();
}

class _SearchOverlayState extends State<SearchOverlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Cari resep...",
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            KeywordChip(keyword: "Nasi Goreng"),
            KeywordChip(keyword: "Soto"),
            KeywordChip(keyword: "Bakso"),
          ],
        ),
      ),
    );
  }
}

class KeywordChip extends StatelessWidget {
  final String keyword;
  KeywordChip({required this.keyword});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(keyword),
      backgroundColor: Colors.red[100],
      deleteIcon: Icon(Icons.close, size: 18),
      onDeleted: () {},
    );
  }
}
