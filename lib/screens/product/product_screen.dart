import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProductScreen(product: product),
    );
  }

  final Product product;

  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: CustomNavBar(
        screen: routeName,
        product: product,
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [HeroCarouselCard(product: product)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(50),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '\$${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    "Product Information",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        product.description ?? '',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Delivery Information",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}








// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_spendr/bloc/cart/cart_bloc.dart';
// import 'package:go_spendr/bloc/wishlist/wishlist_bloc.dart';

// import 'package:go_spendr/models/models.dart';
// import 'package:go_spendr/widgets/custom_appbar.dart';
// import 'package:go_spendr/widgets/hero_carousel_card.dart';
// import 'package:ionicons/ionicons.dart';

// class ProductScreen extends StatelessWidget {
//   static const String routeName = "/product";

//   static Route route(Product product) {
//     return MaterialPageRoute(
//       settings: const RouteSettings(name: routeName),
//       builder: (_) => ProductScreen(product: product),
//     );
//   }

//   final Product product;

//   const ProductScreen({
//     Key? key,
//     required this.product,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: product.name),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.black,
//         child: SizedBox(
//           height: 65,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Ionicons.share,
//                   color: Colors.white,
//                 ),
//               ),
//               BlocBuilder<WishlistBloc, WishlistState>(
//                 builder: (context, state) {
//                   return IconButton(
//                     onPressed: () {
//                       context
//                           .read<WishlistBloc>()
//                           .add(AddProductToWishlist(product));
//                       const snackBar =
//                           SnackBar(content: Text("Added to your Wishlist"));
//                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                     },
//                     icon: const Icon(
//                       Icons.favorite,
//                       color: Colors.white,
//                     ),
//                   );
//                 },
//               ),
//               BlocBuilder<CartBloc, CartState>(
//                 builder: (context, state) {
//                   return ElevatedButton(
//                     style:
//                         ElevatedButton.styleFrom(backgroundColor: Colors.white),
//                     onPressed: () {
//                       context.read<CartBloc>().add(AddProduct(product));
//                       Navigator.pushNamed(context, "/cart");
//                       const snackBar =
//                           SnackBar(content: Text("Added to your Cart"));
//                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                     },
//                     child: const Text(
//                       "ADD TO CART",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           CarouselSlider(
//             options: CarouselOptions(
//               aspectRatio: 1.30,
//               viewportFraction: 1,
//               enlargeCenterPage: true,
//               enlargeStrategy: CenterPageEnlargeStrategy.height,
//             ),
//             items: [
//               HeroCarouselCard(
//                 product: product,
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Stack(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 60,
//                   alignment: Alignment.bottomCenter,
//                   color: Colors.black.withAlpha(50),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width - 10,
//                   height: 50,
//                   margin: const EdgeInsets.all(5.0),
//                   color: Colors.black,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           product.name,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "₹${product.price}",
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ExpansionTile(
//             initiallyExpanded: true,
//             title: const Text(
//               "Product Information",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             children: [
//               ListTile(
//                 title: Text(
//                   "₹${product.description}",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
