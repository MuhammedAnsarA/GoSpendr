// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_spendr/models/product_model.dart';
import 'package:go_spendr/models/wishlist_model.dart';
import 'package:go_spendr/repositories/local_storage/local_storage_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final LocalStorageRepository _localStorageRepository;
  WishlistBloc({
    required LocalStorageRepository localStorageRepository,
  })  : _localStorageRepository = localStorageRepository,
        super(WishlistLoading()) {
    on<LoadWishlist>(_onLoadWishlist);
    on<AddProductToWishlist>(_onAddProductToWishlist);
    on<RemoveProductFromWishlist>(_onRemoveProductToWishlist);
  }

  FutureOr<void> _onLoadWishlist(
      LoadWishlist event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      Box box = await _localStorageRepository.openBox();
      List<Product> products = _localStorageRepository.getWishlist(box);
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(WishlistLoaded(wishlist: Wishlist(products: products)));
    } on Exception {
      emit(WishlistError());
    }
  }

  FutureOr<void> _onAddProductToWishlist(
      AddProductToWishlist event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.addProductToWishlist(box, event.product);

        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  FutureOr<void> _onRemoveProductToWishlist(
      RemoveProductFromWishlist event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.removeProductToWishlist(box, event.product);

        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }
}


//bloc 7

  // Stream<WishlistState> mapEventToState(
  //   WishlistEvent event,
  // ) async* {
  //   if (event is StartWishlist) {
  //     yield* _mapStartWishListToState();
  //   } else if (event is AddWishlistProduct) {
  //     yield* _mapAddWishListProductToState(event, state);
  //   } else if (event is RemoveWishlistProduct) {
  //     yield* _mapRemoveWishListProductToState(event, state);
  //   }
  // }

  // Stream<WishlistState> _mapStartWishListToState() async* {
  //   yield WishlistLoading();
  //   try {
  //     await Future<void>.delayed(const Duration(seconds: 1));
  //     yield const WishlistLoaded();
  //   } catch (_) {}
  // }

  // Stream<WishlistState> _mapAddWishListProductToState(
  //   AddWishlistProduct event,
  //   WishlistState state,
  // ) async* {
  //   if (state is WishlistLoaded) {
  //     try {
  //       yield WishlistLoaded(
  //         wishlist: Wishlist(
  //           products: List.from(state.wishlist.products)..add(event.product),
  //         ),
  //       );
  //     } catch (_) {}
  //   }
  // }

  // Stream<WishlistState> _mapRemoveWishListProductToState(
  //   RemoveWishlistProduct event,
  //   WishlistState state,
  // ) async* {
  //   if (state is WishlistLoaded) {
  //     try {
  //       yield WishlistLoaded(
  //         wishlist: Wishlist(
  //           products: List.from(state.wishlist.products)..remove(event.product),
  //         ),
  //       );
  //     } catch (_) {}
  //   }
  // }
