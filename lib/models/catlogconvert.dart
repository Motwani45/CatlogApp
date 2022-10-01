// To parse this JSON data, do
//
//     final catlogConvert = catlogConvertFromJson(jsonString);

import 'dart:convert';

CatlogConvert catlogConvertFromJson(String str) => CatlogConvert.fromJson(json.decode(str));

String catlogConvertToJson(CatlogConvert data) => json.encode(data.toJson());

class CatlogConvert {
  CatlogConvert({
    required this.products,
  });

  List<Product> products;
  //Get Product by ID
  Product getById(int id)=> products.firstWhere((element) => element.id==id,orElse:null);

  // Get Product by Position
  Product getByPosition(int position)=>products[position];

  factory CatlogConvert.fromJson(Map<String, dynamic> json) => CatlogConvert(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  int id;
  String name;
  String desc;
  int price;
  String color;
  String image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    desc: json["desc"],
    price: json["price"],
    color: json["color"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
    "price": price,
    "color": color,
    "image": image,
  };
}
