class Product {
  int id;
  String name;
  var price;
  int shopID;
  int discountRate;
  String firstOption;
  String secondOption;

  List<Map<String, dynamic>> images;
  List<Map<String, dynamic>> options;
  Map<String, dynamic> shop;
  List<Map<String, dynamic>> details;

  late var finalPrice;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.shopID,
    required this.discountRate,
    required this.firstOption,
    required this.secondOption,
    required this.images,
    required this.shop,
    required this.options,
    required this.details,
  }) {
    finalPrice = discountRate == 0
        ? this.price
        : (1 - (discountRate.toDouble() / 100)) * this.price;
  }
}
