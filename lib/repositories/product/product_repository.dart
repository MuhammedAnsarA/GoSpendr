import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_spendr/models/product_model.dart';
import 'package:go_spendr/repositories/product/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Product.fromJson(
                doc.data(),
                doc.id,
              ))
          .toList();
    });
  }
}