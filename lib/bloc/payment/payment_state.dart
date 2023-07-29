part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentLoading extends PaymentState {}

class PaymentLoaded extends PaymentState {
  final PaymentMethod paymentMethod;

  const PaymentLoaded({
    this.paymentMethod = PaymentMethod.google_pay,
  });

  @override
  List<Object> get props => [paymentMethod];
}





//new


// part of 'payment_bloc.dart';

// enum PaymentStatus { initial, loading, success, failure }

// enum PaymentMethod {
//   google_pay,
//   credit_card,
// }

// class PaymentState extends Equatable {
//   final PaymentStatus status;
//   final PaymentMethod paymentMethod;
//   final stripe.CardFieldInputDetails? cardFieldInputDetails;
//   final String? paymentMethodId;
//   const PaymentState({
//     this.status = PaymentStatus.initial,
//     this.paymentMethod = PaymentMethod.credit_card,
//     this.cardFieldInputDetails =
//         const stripe.CardFieldInputDetails(complete: false),
//     this.paymentMethodId,
//   });

//   PaymentState copyWith({
//     PaymentStatus? status,
//     PaymentMethod? paymentMethod,
//     stripe.CardFieldInputDetails? cardFieldInputDetails,
//     String? paymentMethodId,
//   }) {
//     return PaymentState(
//       status: status ?? this.status,
//       paymentMethod: paymentMethod ?? this.paymentMethod,
//       cardFieldInputDetails:
//           cardFieldInputDetails ?? this.cardFieldInputDetails,
//       paymentMethodId: paymentMethodId ?? this.paymentMethodId,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         status,
//         paymentMethod,
//         paymentMethodId,
//         cardFieldInputDetails,
//       ];
// }

