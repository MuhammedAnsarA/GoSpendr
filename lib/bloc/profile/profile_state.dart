// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Users user;
  const ProfileLoaded({
    required this.user,
  });
}

class ProfileUnauthenticated extends ProfileState {}
