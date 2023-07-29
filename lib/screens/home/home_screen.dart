import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_spendr/bloc/category/category_bloc.dart';
import 'package:go_spendr/bloc/product/product_bloc.dart';
import 'package:go_spendr/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Go Spendr"),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 1),
              child: const _HeroCarousel(),
            ),
            const SearchBox(),
            const SectionTitle(title: "RECOMMENDED"),
            const _ProductCarousel(isPopular: false),
            const SectionTitle(title: "MOST POPULAR"),
            const _ProductCarousel(isPopular: true),
          ],
        ),
      ),
    );
  }
}

class _ProductCarousel extends StatelessWidget {
  const _ProductCarousel({
    Key? key,
    required this.isPopular,
  }) : super(key: key);

  final bool isPopular;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductLoaded) {
          var products = (isPopular)
              ? state.products.where((product) => product.isPopular).toList()
              : state.products
                  .where((product) => product.isRecommended)
                  .toList();
          return Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 165,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: ProductCard.catalog(product: products[index]),
                  );
                },
              ),
            ),
          );
        } else {
          return const Text("Something went wrong");
        }
      },
    );
  }
}

class _HeroCarousel extends StatelessWidget {
  const _HeroCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CategoryLoaded) {
          return CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.70,
              viewportFraction: 1,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enableInfiniteScroll: false,
              initialPage: 2,
              autoPlay: true,
            ),
            items: state.categories
                .map((catagory) => HeroCarouselCard(catagory: catagory))
                .toList(),
          );
        } else {
          return const Text("Something went wrong");
        }
      },
    );
  }
}


// BlocBuilder<ProductBloc, ProductState>(
//               builder: (context, state) {
//                 if (state is ProductLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (state is ProductLoaded) {
//                   return ProductCarousel(
//                       products: state.products
//                           .where((product) => product.isPopular)
//                           .toList());
//                 } else {
//                   return const Text("Something went wrong");
//                 }
//               },
//             ),
