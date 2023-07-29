import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;
  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        imageUrl,
      ];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      name: snap["name"],
      imageUrl: snap["imageUrl"],
    );
    return category;
  }

  static List<Category> categories = [
    const Category(
      name: "Watches",
      imageUrl:
          'https://images.unsplash.com/photo-1539874754764-5a96559165b0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHdhdGNofGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60',
    ),
    const Category(
      name: "Shoes",
      imageUrl:
          'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c2hvZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
    ),
    const Category(
      name: "Cooling Glasses",
      imageUrl:
          'https://images.unsplash.com/photo-1473496169904-658ba7c44d8a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y29vbGluZyUyMGdsYXNzZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
    ),
  ];
}
