import 'package:flutter/material.dart';

class ShoppingCartProvider extends ChangeNotifier {
  List<ShoppingItem> shoppingCart = List.empty();

  void _addItem(ShoppingItem item) {
    shoppingCart.insert(0, item);
    notifyListeners();
  }

  void _removeItem(int productId) {
    shoppingCart.removeWhere((element) => element._getId() == productId);
    notifyListeners();
  }

  void _updateItem(int productId, int count) {
    ShoppingItem item =
        shoppingCart.firstWhere((element) => element._getId() == productId);
    item._setQuantity(count);
    notifyListeners();
  }
}

class ShoppingItem {
  int productId;
  int quantity;
  ShoppingItem({required this.productId, required this.quantity});
  int _getId() {
    return productId;
  }

  int _getQuantity() {
    return quantity;
  }

  void _setQuantity(int newQuantity) {
    quantity = newQuantity;
  }
}
