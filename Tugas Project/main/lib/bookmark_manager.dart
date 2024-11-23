import 'package:shared_preferences/shared_preferences.dart';

class BookmarkManager {
  static const String _bookmarkKey = 'bookmarkedRecipes';

  // BookmarkManager
static Future<void> addBookmark(String recipeId) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> bookmarks = prefs.getStringList(_bookmarkKey) ?? [];
  if (!bookmarks.contains(recipeId)) {
    bookmarks.add(recipeId);
    await prefs.setStringList(_bookmarkKey, bookmarks);
    print("Bookmark ditambahkan: $bookmarks");
  }
}

static Future<void> removeBookmark(String recipeId) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> bookmarks = prefs.getStringList(_bookmarkKey) ?? [];
  if (bookmarks.contains(recipeId)) {
    bookmarks.remove(recipeId);
    await prefs.setStringList(_bookmarkKey, bookmarks);
    print("Bookmark dihapus: $bookmarks");
  }
}

static Future<List<String>> getBookmarkedRecipes() async {
  final prefs = await SharedPreferences.getInstance();
  final bookmarks = prefs.getStringList(_bookmarkKey) ?? [];
  print("Daftar bookmark saat ini: $bookmarks");
  return bookmarks;
}


  // Mengecek apakah resep sudah dibookmark
  static Future<bool> isBookmarked(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bookmarks = prefs.getStringList(_bookmarkKey) ?? [];
    return bookmarks.contains(recipeId);
  }
}
