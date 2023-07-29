import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_spendr/bloc/cart/cart_bloc.dart';
import 'package:go_spendr/bloc/checkout/checkout_bloc.dart';
import 'package:go_spendr/bloc/wishlist/wishlist_bloc.dart';

import '/widgets/widgets.dart';
import '/models/models.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;

  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: (screen == '/product')
            ? AddToCartNavBar(product: product!)
            : (screen == '/cart')
                ? const GoToCheckoutNavBar()
                : (screen == '/checkout')
                    ? const OrderNowNavBar()
                    : const HomeNavBar(),
      ),
    );
  }
}

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/wishlist");
          },
          icon: const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        )
      ],
    );
  }
}

class AddToCartNavBar extends StatelessWidget {
  const AddToCartNavBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.share, color: Colors.white),
          onPressed: () {},
        ),
        BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return const CircularProgressIndicator();
            }
            if (state is WishlistLoaded) {
              return IconButton(
                icon: const Icon(Icons.favorite, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to your Wishlist!'),
                    ),
                  );
                  context
                      .read<WishlistBloc>()
                      .add(AddProductToWishlist(product));
                },
              );
            }
            return const Text('Something went wrong!');
          },
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const CircularProgressIndicator();
            }
            if (state is CartLoaded) {
              return ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(AddProduct(product));
                  Navigator.pushNamed(context, '/cart');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(),
                ),
                child: Text(
                  'ADD TO CART',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            }
            return const Text('Something went wrong!');
          },
        ),
      ],
    );
  }
}

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/checkout');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(),
          ),
          child: Text(
            'GO TO CHECKOUT',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

class OrderNowNavBar extends StatelessWidget {
  const OrderNowNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            if (state is CheckoutLoaded) {
              if (Platform.isAndroid) {
                switch (state.checkout.paymentMethod) {
                  case PaymentMethod.google_pay:
                    return GooglePay(
                      products: state.checkout.cart.products,
                      total: state.checkout.total.toString(),
                    );
                  case PaymentMethod.credit_card:
                    return Container(
                      child: const Text(
                        "Pay with credit card",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  default:
                    return GooglePay(
                      products: state.checkout.cart.products,
                      total: state.checkout.total.toString(),
                    );
                }
              } else {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/payment-selection');
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text(
                    'CHOOSE PAYMENT',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                );
              }
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ],
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';

// class CustomNavBar extends StatelessWidget {
//   const CustomNavBar({
//     super.key,
//     required String screen,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       elevation: 0,
//       color: Colors.white,
//       child: Container(
//         margin: const EdgeInsets.all(10),
//         height: 60,
//         decoration: BoxDecoration(
//             color: Colors.black, borderRadius: BorderRadius.circular(10)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, "/");
//               },
//               icon: const Icon(
//                 Ionicons.home,
//                 color: Colors.white,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, "/wishlist");
//               },
//               icon: const Icon(
//                 Icons.favorite,
//                 color: Colors.white,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, "/cart");
//               },
//               icon: const Icon(
//                 Ionicons.cart,
//                 color: Colors.white,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, "/user");
//               },
//               icon: const Icon(
//                 Ionicons.person,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
