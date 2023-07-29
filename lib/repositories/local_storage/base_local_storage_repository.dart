import 'package:go_spendr/models/models.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BaseLocalStorageRepository {
  Future<Box> openBox();
  List<Product> getWishlist(Box box);
  Future<void> addProductToWishlist(Box box, Product product);
  Future<void> removeProductToWishlist(Box box, Product product);
  Future<void> clearWishlist(Box box);
}
