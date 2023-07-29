import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_spendr/bloc/order_confirmation/order_confirmation_bloc.dart';
import 'package:go_spendr/repositories/checkout/checkout_repository.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order-confirmation';

  const OrderConfirmation({super.key, required this.checkoutId});

  static Route route({required String checkoutId}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => BlocProvider(
        create: (context) => OrderConfirmationBloc(
          checkoutRepository: context.read<CheckoutRepository>(),
        )..add(LoadOrderConfirmation(checkoutId)),
        child: OrderConfirmation(checkoutId: checkoutId),
      ),
    );
  }

  final String checkoutId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Order Confirmation'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<OrderConfirmationBloc, OrderConfirmationState>(
        builder: (context, state) {
          if (state is OrderConfirmationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is OrderConfirmationLoaded) {
            List<Product> products = state.checkout.cart.products;
            Map cart = state.checkout.cart.productQuantity(products);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.black,
                        width: double.infinity,
                        height: 300,
                      ),
                      Positioned(
                        left: (MediaQuery.of(context).size.width - 100) / 2,
                        top: 125,
                        child: Image.asset(
                          'assets/images/correct.png',
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Positioned(
                        top: 250,
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Your order is complete!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi ${state.checkout.user!.fullName},',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Thank you for purchasing on Go Spendr.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'ORDER CODE: #$checkoutId',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        OrderSummary(
                          cart: state.checkout.cart,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'ORDER DETAILS',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Divider(thickness: 2),
                        const SizedBox(height: 5),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cart.keys.length,
                          itemBuilder: (context, index) {
                            return ProductCard.summary(
                              product: cart.keys.elementAt(index),
                              quantity: cart.values.elementAt(index),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text("Something went wrong");
          }
        },
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:go_spendr/models/models.dart';

// import '/widgets/widgets.dart';

// class OrderConfirmation extends StatelessWidget {
//   static const String routeName = '/order-confirmation';

//   const OrderConfirmation({super.key});

//   static Route route() {
//     return MaterialPageRoute(
//       settings: const RouteSettings(name: routeName),
//       builder: (context) => const OrderConfirmation(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(title: 'Order Confirmation'),
//       bottomNavigationBar: const CustomNavBar(screen: routeName),
//       extendBodyBehindAppBar: true,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   color: Colors.black,
//                   width: double.infinity,
//                   height: 300,
//                 ),
//                 Positioned(
//                   left: (MediaQuery.of(context).size.width - 100) / 2,
//                   top: 125,
//                   child: Image.asset(
//                     'assets/images/correct.png',
//                     height: 100,
//                     width: 100,
//                   ),
//                 ),
//                 Positioned(
//                   top: 250,
//                   height: 100,
//                   width: MediaQuery.of(context).size.width,
//                   child: const Text(
//                     'Your order is complete!',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Hi Ansar,',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Thank you for purchasing on Go Spendr.',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'ORDER CODE: #k321-ekd3',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17,
//                     ),
//                   ),
//                   const OrderSummary(),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'ORDER DETAILS',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17,
//                     ),
//                   ),
//                   const Divider(thickness: 2),
//                   const SizedBox(height: 5),
//                   ListView(
//                     shrinkWrap: true,
//                     padding: EdgeInsets.zero,
//                     physics: const NeverScrollableScrollPhysics(),
//                     children: [
//                       OrderSummaryProductCard(
//                         product: Product.products[0],
//                         quantity: 2,
//                       ),
//                       OrderSummaryProductCard(
//                         product: Product.products[1],
//                         quantity: 2,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
