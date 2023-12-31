import 'package:equatable/equatable.dart';
import '/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  Map<String, dynamic> toDocument() {
    return {
      "products": products.map((product) => product.toDocument()).toList(),
    };
  }

  static Cart fromJson(Map<String, dynamic> json) {
    Cart cart = Cart(
      products: (json["products"] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
    );
    return cart;
  }

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 1000) {
      return 0.0;
    } else {
      return 40.0;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 1000) {
      return 'You have Free Delivery';
    } else {
      num missing = 1000 - subtotal;
      return "Add ₹${missing.toStringAsFixed(2)} for FREE delivery";
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);
}
