import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_spendr/models/payment_method_model.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentLoading()) {
    on<LoadPaymentMethod>(_onLoadPaymentMethod);
    on<SelectPaymentMethod>(_onSelectPaymentMethod);
  }

  void _onLoadPaymentMethod(
    LoadPaymentMethod event,
    Emitter<PaymentState> emit,
  ) {
    emit(
      const PaymentLoaded(),
    );
  }

  void _onSelectPaymentMethod(
    SelectPaymentMethod event,
    Emitter<PaymentState> emit,
  ) {
    emit(
      PaymentLoaded(paymentMethod: event.paymentMethod),
    );
  }
}


//new

// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
// import 'package:equatable/equatable.dart';
// import 'package:flutter_stripe/flutter_stripe.dart%20';

// part 'payment_event.dart';
// part 'payment_state.dart';

// class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
//   PaymentBloc() : super(const PaymentState()) {
//     on<StartPayment>(_onStartPayment);
//     on<SelectPaymentMethod>(_onSelectPaymentMethod);
//     on<CreatePaymentIntent>(_onCreatePaymentIntent);
//   }

//   void _onStartPayment(
//     StartPayment event,
//     Emitter<PaymentState> emit,
//   ) {
//     emit(state.copyWith(status: PaymentStatus.initial));
//   }

//   void _onSelectPaymentMethod(
//     SelectPaymentMethod event,
//     Emitter<PaymentState> emit,
//   ) {
//     emit(state.copyWith(
//       paymentMethod: event.paymentMethod,
//       paymentMethodId: event.paymentMethodId,
//     ));
//   }

//   FutureOr<void> _onCreatePaymentIntent(
//       CreatePaymentIntent event, Emitter<PaymentState> emit) async {
//     emit(state.copyWith(status: PaymentStatus.loading));

//     final paymentIntentResult = await _callPayEndpointMethodId(
//       useStripeSdk: true,
//       paymentMethodId: event.paymentMethodId,
//       currency: "inr",
//       amount: event.amount,
//     );
//   }

//   Future<Map<String, dynamic>> _callPayEndpointMethodId({
//     required bool useStripeSdk,
//     required String paymentMethodId,
//     required String currency,
//     required int amount,
//   }) async {
//     final url = Uri.parse(uri);
//   }
// }



