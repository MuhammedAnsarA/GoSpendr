import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_spendr/bloc/checkout/checkout_bloc.dart';
import 'package:go_spendr/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:go_spendr/widgets/custom_text_form_field.dart';

import '../../models/models.dart';
import '/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  const CheckoutScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<CheckoutBloc, CheckoutState>(
          listener: (context, state) {
            if ((state as CheckoutLoaded).checkout.isPaymentSuccessful) {
              Navigator.pushNamed(
                context,
                OrderConfirmation.routeName,
                arguments: state.checkout.id,
              );
            }
          },
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              var user = state.checkout.user ?? Users.empty;
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CUSTOMER INFORMATION',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  CustomTextFormField(
                    title: 'Email',
                    initialValue: user.email,
                    onChanged: (value) {
                      Users user = state.checkout.user!.copyWith(
                        email: value,
                      );
                      context.read<CheckoutBloc>().add(
                          UpdateCheckout(state.checkout.copyWith(user: user)));
                    },
                  ),
                  CustomTextFormField(
                    title: 'Full Name',
                    initialValue: user.fullName,
                    onChanged: (value) {
                      Users user = state.checkout.user!.copyWith(
                        fullName: value,
                      );
                      context.read<CheckoutBloc>().add(
                          UpdateCheckout(state.checkout.copyWith(user: user)));
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'DELIVERY INFORMATION',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  CustomTextFormField(
                    title: 'Address',
                    initialValue: user.address,
                    onChanged: (value) {
                      Users user = state.checkout.user!.copyWith(
                        address: value,
                      );
                      context.read<CheckoutBloc>().add(
                          UpdateCheckout(state.checkout.copyWith(user: user)));
                    },
                  ),
                  CustomTextFormField(
                    title: 'City',
                    initialValue: user.city,
                    onChanged: (value) {
                      Users user = state.checkout.user!.copyWith(
                        city: value,
                      );
                      context.read<CheckoutBloc>().add(
                          UpdateCheckout(state.checkout.copyWith(user: user)));
                    },
                  ),
                  CustomTextFormField(
                    title: 'Country',
                    initialValue: user.country,
                    onChanged: (value) {
                      Users user = state.checkout.user!.copyWith(
                        country: value,
                      );
                      context.read<CheckoutBloc>().add(
                          UpdateCheckout(state.checkout.copyWith(user: user)));
                    },
                  ),
                  CustomTextFormField(
                    title: 'ZIP Code',
                    initialValue: user.zipCode,
                    onChanged: (value) {
                      Users user = state.checkout.user!.copyWith(
                        zipCode: value,
                      );
                      context.read<CheckoutBloc>().add(
                          UpdateCheckout(state.checkout.copyWith(user: user)));
                    },
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/payment-selection',
                              );
                            },
                            child: Text(
                              'SELECT A PAYMENT METHOD',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'ORDER SUMMARY',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  OrderSummary(
                    cart: state.checkout.cart,
                  )
                ],
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}
