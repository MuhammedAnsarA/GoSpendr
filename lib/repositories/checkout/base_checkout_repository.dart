import 'package:go_spendr/models/checkout_model.dart';

abstract class BaseCheckoutRepository {
  Future<String> addCheckout(Checkout checkout);
  Future<Checkout> getCheckout(String checkoutId);
}
