import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hoi_event.dart';
part 'hoi_state.dart';

class HoiBloc extends Bloc<HoiEvent, HoiState> {
  HoiBloc() : super(HoiInitial()) {
    on<HoiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
