import 'package:flutter/material.dart';
import 'package:go_spendr/models/cart_model.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.cart});

  final Cart cart;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 2,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "SUBTOTAL",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "₹${cart.subtotalString}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "DELIVERY FEE",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "₹${cart.deliveryFeeString}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "TOTAL",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "₹${cart.totalString}",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
