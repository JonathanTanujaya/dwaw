// bookmark_manager.dart
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkManager {
  static const String _bookmarkKey = 'bookmarkedRecipes';

  // Mendapatkan daftar ID resep yang dibookmark
  static Future<List<String>> getBookmarkedRecipes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_bookmarkKey) ?? [];
  }

  // Menambahkan resep ke bookmark
  static Future<void> addBookmark(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bookmarks = prefs.getStringList(_bookmarkKey) ?? [];
    if (!bookmarks.contains(recipeId)) {
      bookmarks.add(recipeId);
      await prefs.setStringList(_bookmarkKey, bookmarks);
    }
  }

  // Menghapus resep dari bookmark
  static Future<void> removeBookmark(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bookmarks = prefs.getStringList(_bookmarkKey) ?? [];
    if (bookmarks.contains(recipeId)) {
      bookmarks.remove(recipeId);
      await prefs.setStringList(_bookmarkKey, bookmarks);
    }
  }

  // Mengecek apakah resep sudah dibookmark
  static Future<bool> isBookmarked(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bookmarks = prefs.getStringList(_bookmarkKey) ?? [];
    return bookmarks.contains(recipeId);
  }
}
