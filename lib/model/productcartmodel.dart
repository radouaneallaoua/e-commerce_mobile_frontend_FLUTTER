import 'package:e_commerce_app/model/productmodel.dart';

class ProductCartModel {
  ProductModel product;
  int quantity;
  ProductCartModel(
      {required this.product,
      required this.quantity,
   });
  void setQuantity(int newQuantity) {
    quantity = newQuantity;
  }
}
