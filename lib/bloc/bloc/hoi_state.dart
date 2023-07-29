part of 'hoi_bloc.dart';

abstract class HoiState extends Equatable {
  const HoiState();
  
  @override
  List<Object> get props => [];
}

class HoiInitial extends HoiState {}
