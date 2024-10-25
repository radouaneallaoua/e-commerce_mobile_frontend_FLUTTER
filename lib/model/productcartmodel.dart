import 'package:chat_app/model/productmodel.dart';

class ProductCart {
  ProductModel product;
  int quantity;
  ProductCart(
      {required this.product,
      required this.quantity,
   });
  void setQuantity(int newQuantity) {
    quantity = newQuantity;
  }
}
