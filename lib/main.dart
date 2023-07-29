import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_spendr/bloc/auth/auth_bloc.dart';
import 'package:go_spendr/bloc/cart/cart_bloc.dart';
import 'package:go_spendr/bloc/checkout/checkout_bloc.dart';
import 'package:go_spendr/bloc/payment/payment_bloc.dart';
import 'package:go_spendr/bloc/search/search_bloc.dart';
import 'package:go_spendr/cubits/login/login_cubit.dart';
import 'package:go_spendr/cubits/signup/signup_cubit.dart';
import 'package:go_spendr/models/product_model.dart';
import 'package:go_spendr/repositories/auth/auth_repository.dart';
import 'package:go_spendr/repositories/category/category_repository.dart';
import 'package:go_spendr/repositories/checkout/checkout_repository.dart';
import 'package:go_spendr/repositories/local_storage/local_storage_repository.dart';
import 'package:go_spendr/repositories/product/product_repository.dart';
import 'package:go_spendr/repositories/user/user_repository.dart';
import 'package:go_spendr/screens/screens.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:go_spendr/.env';
import '/config/theme.dart';
import '/config/app_router.dart';
import '/simple_bloc_observer.dart';
import 'bloc/category/category_bloc.dart';
import 'bloc/product/product_bloc.dart';
import 'bloc/wishlist/wishlist_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Spendr',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
          RepositoryProvider(
            create: (context) =>
                AuthRepository(userRepository: context.read<UserRepository>()),
          ),
          RepositoryProvider(
            create: (context) => CheckoutRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                  authRepository: context.read<AuthRepository>(),
                  userRepository: context.read<UserRepository>()),
            ),
            BlocProvider(
              create: (_) => CartBloc()..add(LoadCart()),
            ),
            BlocProvider(
              create: (_) => PaymentBloc()..add(LoadPaymentMethod()),
            ),
            BlocProvider(
              create: (context) => CheckoutBloc(
                authBloc: context.read<AuthBloc>(),
                cartBloc: context.read<CartBloc>(),
                paymentBloc: context.read<PaymentBloc>(),
                checkoutRepository: context.read<CheckoutRepository>(),
              ),
            ),
            BlocProvider(
              create: (_) =>
                  WishlistBloc(localStorageRepository: LocalStorageRepository())
                    ..add(LoadWishlist()),
            ),
            BlocProvider(
              create: (_) => CategoryBloc(
                categoryRepository: CategoryRepository(),
              )..add(
                  LoadCategories(),
                ),
            ),
            BlocProvider(
              create: (_) => ProductBloc(
                productRepository: ProductRepository(),
              )..add(LoadProducts()),
            ),
            BlocProvider(
              create: (context) => SearchBloc(
                productBloc: context.read<ProductBloc>(),
              )..add(LoadSearch()),
            ),
            BlocProvider(
              create: (context) => LoginCubit(
                authRepository: context.read<AuthRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => SignupCubit(
                authRepository: context.read<AuthRepository>(),
              ),
            ),
          ],
          child: MaterialApp(
            title: 'Go Spendr',
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: SplashScreen.routeName,
          ),
        ),
      ),
    );
  }
}
