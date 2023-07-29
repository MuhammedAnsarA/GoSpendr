import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_spendr/cubits/login/login_cubit.dart';
import 'package:go_spendr/widgets/custom_appbar.dart';
import 'package:go_spendr/widgets/custom_navbar.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoginScreen(),
    );
  }

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Login"),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _EmailInput(),
              const SizedBox(
                height: 10,
              ),
              _PasswordInput(),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().loginWithCredentials();
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Colors.black,
                  fixedSize: const Size(200, 40),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              _GoogleLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          decoration: const InputDecoration(labelText: "Email"),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          decoration: const InputDecoration(labelText: "Password"),
          obscureText: true,
        );
      },
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          backgroundColor: Colors.white,
          fixedSize: const Size(200, 40)),
      onPressed: () {
        context.read<LoginCubit>().loginWithGoogle();
      },
      child: const Text(
        "Sign In With Google",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
