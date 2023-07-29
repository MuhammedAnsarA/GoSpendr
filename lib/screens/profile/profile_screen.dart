import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_spendr/bloc/auth/auth_bloc.dart';
import 'package:go_spendr/bloc/profile/profile_bloc.dart';
import 'package:go_spendr/repositories/auth/auth_repository.dart';
import 'package:go_spendr/repositories/user/user_repository.dart';
import 'package:go_spendr/widgets/custom_appbar.dart';
import 'package:go_spendr/widgets/custom_navbar.dart';
import 'package:go_spendr/widgets/custom_text_form_field.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(
          authBloc: context.read<AuthBloc>(),
          userRepository: context.read<UserRepository>(),
        )..add(LoadProfile(context.read<AuthBloc>().state.authUser)),
        child: const ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Profile"),
        bottomNavigationBar: const CustomNavBar(screen: routeName),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            if (state is ProfileLoaded) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "CUSTOMER INFORMATION",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      title: "Email",
                      initialValue: state.user.email,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                              UpdateProfile(
                                state.user.copyWith(email: value),
                              ),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      title: "Full Name",
                      initialValue: state.user.fullName,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                              UpdateProfile(
                                state.user.copyWith(fullName: value),
                              ),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      title: "Address",
                      initialValue: state.user.address,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                              UpdateProfile(
                                state.user.copyWith(address: value),
                              ),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      title: "City",
                      initialValue: state.user.city,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                              UpdateProfile(
                                state.user.copyWith(city: value),
                              ),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      title: "Country",
                      initialValue: state.user.country,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                              UpdateProfile(
                                state.user.copyWith(country: value),
                              ),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      title: "Zip Code",
                      initialValue: state.user.zipCode,
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(
                              UpdateProfile(
                                state.user.copyWith(zipCode: value),
                              ),
                            );
                      },
                    ),
                    Expanded(child: Container()),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          backgroundColor: Colors.black,
                          fixedSize: const Size(200, 40),
                        ),
                        onPressed: () {
                          context.read<AuthRepository>().signOut();
                        },
                        child: const Text("Sign Out"),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is ProfileUnauthenticated) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        "You're not logged in",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: Colors.black,
                        fixedSize: const Size(200, 40)),
                    child: const Text("Login"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: Colors.black,
                        fixedSize: const Size(200, 40)),
                    child: const Text("Sign Up"),
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
