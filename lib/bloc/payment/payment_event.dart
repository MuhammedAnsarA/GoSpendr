part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class LoadPaymentMethod extends PaymentEvent {}

class SelectPaymentMethod extends PaymentEvent {
  final PaymentMethod paymentMethod;

  const SelectPaymentMethod({required this.paymentMethod});

  @override
  List<Object> get props => [paymentMethod];
}



//new


// part of 'payment_bloc.dart';

// abstract class PaymentEvent extends Equatable {
//   const PaymentEvent();

//   @override
//   List<Object?> get props => [];
// }

// class StartPayment extends PaymentEvent {}

// class SelectPaymentMethod extends PaymentEvent {
//   final PaymentMethod paymentMethod;
//   final String? paymentMethodId;

//   const SelectPaymentMethod({
//     required this.paymentMethod,
//     this.paymentMethodId,
//   });

//   @override
//   List<Object?> get props => [paymentMethod, paymentMethodId];
// }

// class CreatePaymentIntent extends PaymentEvent {
//   final String paymentMethodId;
//   final int amount;
//   const CreatePaymentIntent({
//     required this.paymentMethodId,
//     required this.amount,
//   });
//   @override
//   List<Object?> get props => [amount, paymentMethodId];
// }
