import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_spendr/bloc/cart/cart_bloc.dart';

import 'package:go_spendr/widgets/cart_product_card.dart';
import 'package:go_spendr/widgets/custom_appbar.dart';
import 'package:go_spendr/widgets/order_summary.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "/cart";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Cart"),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 105,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Center(
                                child: Text(
                                  "Add More Items",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 325,
                        child: ListView.builder(
                          itemCount: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .length,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              product: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .elementAt(index),
                              quantity: state.cart
                                  .productQuantity(state.cart.products)
                                  .values
                                  .elementAt(index),
                            );
                          },
                        ),
                      ),
                      OrderSummary(cart: state.cart),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/checkout");
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Text(
                              "GO TO CHECKOUT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Text("Something went wrong");
            }
          },
        ));
  }
}
