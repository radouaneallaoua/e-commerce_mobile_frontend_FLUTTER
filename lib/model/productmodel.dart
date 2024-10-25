class ProductModel {
  int productId;
  String productName;
  String productDescription;
  double price;
  double oldPrice;
  String productImageURL;
  bool isFavorate = false;
  ProductModel(
      {required this.productId,
      required this.productName,
      required this.productDescription,
      required this.price,
      required this.oldPrice,
      required this.productImageURL});
  void setIsFavorate(bool isFavorate) {
    this.isFavorate = isFavorate;
  }
  
}
