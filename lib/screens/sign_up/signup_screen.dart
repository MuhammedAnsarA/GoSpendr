// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_spendr/widgets/custom_appbar.dart';
import 'package:go_spendr/widgets/custom_navbar.dart';

import '../../cubits/signup/signup_cubit.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = "/signup";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SignupScreen(),
    );
  }

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Sign Up"),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _UserInput(
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(email: value),
                            );
                      },
                      labelText: "Email"),
                  const SizedBox(
                    height: 10,
                  ),
                  _UserInput(
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(fullName: value),
                            );
                      },
                      labelText: "Full Name"),
                  const SizedBox(
                    height: 10,
                  ),
                  _UserInput(
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(country: value),
                            );
                      },
                      labelText: "Country"),
                  const SizedBox(
                    height: 10,
                  ),
                  _UserInput(
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(city: value),
                            );
                      },
                      labelText: "City"),
                  const SizedBox(
                    height: 10,
                  ),
                  _UserInput(
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(address: value),
                            );
                      },
                      labelText: "Address"),
                  const SizedBox(
                    height: 10,
                  ),
                  _UserInput(
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(zipCode: value),
                            );
                      },
                      labelText: "Zip Code"),
                  const SizedBox(
                    height: 10,
                  ),
                  _PasswordInput(),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<SignupCubit>().signUpWithCredentials();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: Colors.black,
                        fixedSize: const Size(200, 40),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _UserInput extends StatelessWidget {
  const _UserInput({
    Key? key,
    required this.onChanged,
    required this.labelText,
  }) : super(key: key);

  final Function(String)? onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return TextField(
          onChanged: onChanged,
          decoration: InputDecoration(labelText: labelText),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<SignupCubit>().passwordChanged(password);
          },
          decoration: const InputDecoration(
            labelText: "Password",
          ),
          obscureText: true,
        );
      },
    );
  }
}
