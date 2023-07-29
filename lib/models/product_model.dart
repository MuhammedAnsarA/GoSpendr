import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final num price;
  @HiveField(5)
  final bool isRecommended;
  @HiveField(6)
  final bool isPopular;
  @HiveField(7)
  final String? description;
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    this.description,
  });

  static Product fromJson(
    Map<String, dynamic> json, [
    String? id,
  ]) {
    Product product = Product(
      id: id ?? json["id"],
      name: json["name"],
      category: json["category"],
      imageUrl: json["imageUrl"],
      price: json["price"],
      isRecommended: json["isRecommended"],
      isPopular: json["isPopular"],
      description: json["description"],
    );
    return product;
  }

  Map<String, dynamic> toDocument() {
    return {
      "id": id,
      "name": name,
      "category": category,
      "imageUrl": imageUrl,
      "price": price,
      "isRecommended": isRecommended,
      "isPopular": isPopular,
      "description": description,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
        description,
      ];

  static List<Product> products = [
    const Product(
      id: "1",
      name: "Coca Cola",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1622483767028-3f66f32aef97?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGNvY2ElMjBjb2xhfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      price: 130,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: "2",
      name: "Red Bull",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1613218222876-954978a4404e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmVkJTIwYnVsbHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      price: 140,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: "3",
      name: "Monster",
      category: "Shoes",
      imageUrl:
          "https://images.unsplash.com/photo-1622543925917-763c34d1a86e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW9uc3RlciUyMGRyaW5rfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      price: 60,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: "4",
      name: "Pepsi",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1629203849820-fdd70d49c38e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVwc2l8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      price: 40,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      id: "5",
      name: "Dragon Smoothie",
      category: "Smoothies",
      imageUrl:
          "https://images.unsplash.com/photo-1483918793747-5adbf82956c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8U21vb3RoaWVzfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      price: 80,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      id: "6",
      name: "Vegetable Smoothie",
      category: "Smoothies",
      imageUrl:
          "https://images.unsplash.com/photo-1610970881699-44a5587cabec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8U21vb3RoaWVzfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      price: 40,
      isRecommended: true,
      isPopular: false,
    ),
  ];
}
