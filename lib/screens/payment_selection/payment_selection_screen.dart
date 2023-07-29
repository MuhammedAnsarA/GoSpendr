import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:go_spendr/bloc/blocs.dart';
import 'package:go_spendr/models/models.dart';
import 'package:go_spendr/widgets/custom_appbar.dart';
import 'package:go_spendr/widgets/custom_navbar.dart';
import 'package:pay/pay.dart';

class PaymentSelection extends StatelessWidget {
  static const String routeName = '/payment-selection';

  const PaymentSelection({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PaymentSelection(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Payment Selection'),
        bottomNavigationBar: const CustomNavBar(screen: routeName),
        body: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            if (state is PaymentLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PaymentLoaded) {
              stripe.CardFormEditController controller =
                  stripe.CardFormEditController();
              return ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  const Text(
                    "Add your Credit Card Details",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  stripe.CardFormField(controller: controller),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder()),
                    onPressed: () async {
                      if (controller.details.complete) {
                        final stripePaymentMethod =
                            await stripe.Stripe.instance.createPaymentMethod(
                          params: stripe.PaymentMethodParams.card(
                            paymentMethodData: stripe.PaymentMethodData(
                              billingDetails: stripe.BillingDetails(
                                email: (context.read<CheckoutBloc>().state
                                        as CheckoutLoaded)
                                    .checkout
                                    .user!
                                    .email,
                              ),
                            ),
                          ),
                        );
                        context.read<PaymentBloc>().add(
                            const SelectPaymentMethod(
                                paymentMethod: PaymentMethod.credit_card));
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("The form is not complete"),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Pay with credit card",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Choose a different payment method",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RawGooglePayButton(
                    type: GooglePayButtonType.pay,
                    onPressed: () {
                      context.read<PaymentBloc>().add(const SelectPaymentMethod(
                          paymentMethod: PaymentMethod.google_pay));
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            } else {
              return const Text("Something went wrong");
            }
          },
        ));
  }
}
