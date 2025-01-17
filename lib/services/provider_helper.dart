import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  // Store items in cart and favorites
  final List<Map<String, dynamic>> _cart = [];
  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get cart => _cart;
  List<Map<String, dynamic>> get favorites => _favorites;

  // Add item to cart
  void addToCart(Map<String, dynamic> item) {
    _cart.add(item);
    notifyListeners();
  }

  // Add item to favorites
  void addToFavorites(Map<String, dynamic> item) {
    _favorites.add(item);
    notifyListeners();
  }

  // Check if item is in the cart
  bool isInCart(Map<String, dynamic> item) {
    return _cart.contains(item);
  }

  // Check if item is in the favorites
  bool isInFavorites(Map<String, dynamic> item) {
    return _favorites.contains(item);
  }

  // Remove item from cart
  void removeFromCart(Map<String, dynamic> item) {
    _cart.remove(item);
    notifyListeners();
  }

  // Remove item from favorites
  void removeFromFavorites(Map<String, dynamic> item) {
    _favorites.remove(item);
    notifyListeners();
  }
}
