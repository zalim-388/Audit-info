import 'package:audit_info/Repositry/model/SRO_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sro_event.dart';
part 'sro_state.dart';

class SroBloc extends Bloc<SroEvent, SroState> {
  SroBloc() : super(SroInitial()) {
    on<fetchSro>((event, emit) {
      emit(SroBlocloading());

      
    });
  }
}
