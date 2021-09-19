import 'dart:convert';

const String noData = 'No Data';

List<SearchProduct> searchProductsFromJson(String str) =>
    List<SearchProduct>.from(
        json.decode(str).map((x) => SearchProduct.fromJson(x)));

class SearchProduct {
  SearchProduct({
    required this.id,
    this.name = noData,
    this.price = 0,
    this.content = noData,
    this.status = '',
    // this.reviewed = false,
    this.negotiable = false,
    this.view = 0,
    required this.createdAt,
    this.images = const [],
    required this.user,
  });

  final int id;
  final String name;
  final int price;
  final String content;
  final String status;
  // final bool reviewed;
  final bool negotiable;
  final int view;
  final DateTime createdAt;
  final List<dynamic> images;
  final User user;

  factory SearchProduct.fromJson(Map<String, dynamic> json) => SearchProduct(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        content: json["content"],
        status: json["status"],
        // reviewed: json["reviewd"],
        negotiable: json["negotiable"],
        view: json["view"],
        createdAt: DateTime.parse(json["created_at"]),
        images: List<dynamic>.from(json["images"].map((x) => x)),
        user: User.fromJson(json["seller"]),
      );
}

class User {
  User({
    this.id = 0,
    this.phoneNumber = noData,
    this.password = noData,
    this.userName = noData,
    this.profileImage = noData,
    this.location = noData,
    required this.createdAt,
  });

  int id;
  String? phoneNumber;
  String? password;
  String? userName;
  String? profileImage;
  String? location;
  DateTime createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        userName: json["user_name"],
        profileImage: json["profile_image"],
        location: json["location"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
