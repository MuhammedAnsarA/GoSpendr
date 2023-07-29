import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_spendr/models/catagory_model.dart';
import 'package:ionicons/ionicons.dart';

import 'package:go_spendr/bloc/search/search_bloc.dart';
import 'package:go_spendr/widgets/widgets.dart';

class SearchBox extends StatelessWidget {
  final Category? category;
  const SearchBox({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        if (state is SearchLoaded) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Search for a product",
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: Icon(
                              Ionicons.search,
                              color: Colors.black,
                            ),
                            contentPadding: EdgeInsets.all(10),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                        onChanged: (value) {
                          context.read<SearchBloc>().add(SearchProduct(
                                productName: value,
                                category: category,
                              ));
                        },
                      ),
                    ),
                  ],
                ),
                state.products.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return ProductCard.catalog(
                            product: state.products[index],
                            widthFactor: 1.1,
                          );
                        },
                      )
                    : const SizedBox(),
              ],
            ),
          );
        } else {
          return const Text("Something went wrong");
        }
      },
    );
  }
}
