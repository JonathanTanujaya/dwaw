import 'package:flutter/material.dart';

class SearchOverlay extends ModalRoute<void> {
  @override
  Color? get barrierColor => Colors.black.withOpacity(0.5);

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => "Search";

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 8.0, right: 8.0, bottom: 8.0), // Add padding to position at the top
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari resep...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              Wrap(
                children: [
                  KeywordChip(keyword: "Nasi Goreng"),
                  KeywordChip(keyword: "Soto"),
                  KeywordChip(keyword: "Bakso"),
                ],
              ),
            ],
          ),
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
      onDeleted: () {},
    );
  }
}
