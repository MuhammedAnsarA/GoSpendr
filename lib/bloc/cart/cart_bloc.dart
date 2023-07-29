import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_spendr/models/cart_model.dart';
import 'package:go_spendr/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  FutureOr<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }

  FutureOr<void> _onAddProduct(AddProduct event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product))));
      } on Exception {
        emit(CartError());
      }
    }
  }

  FutureOr<void> _onRemoveProduct(
      RemoveProduct event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(event.product))));
      } on Exception {
        emit(CartError());
      }
    }
  }
}
