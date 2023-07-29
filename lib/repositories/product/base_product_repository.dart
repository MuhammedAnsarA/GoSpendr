import 'package:go_spendr/models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
