import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_spendr/bloc/auth/auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 1),
      () => Navigator.pushNamed(context, '/'),
    );

    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.authUser != current.authUser,
      listener: (context, state) {
        print('Splash screen Auth Listener');
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/images/shopping_cart.gif'),
                width: 125,
                height: 125,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: const Text(
                'Go Spendr',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
