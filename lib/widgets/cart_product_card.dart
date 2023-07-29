// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:go_spendr/bloc/cart/cart_bloc.dart';
import 'package:go_spendr/models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "₹${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(RemoveProduct(product));
                    },
                    icon: const Icon(Ionicons.remove_circle),
                  ),
                  Text(
                    "$quantity",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(AddProduct(product));
                    },
                    icon: const Icon(Ionicons.add_circle),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
