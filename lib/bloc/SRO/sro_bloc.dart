import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sro_event.dart';
part 'sro_state.dart';

class SroBloc extends Bloc<SroEvent, SroState> {
  SroBloc() : super(SroInitial()) {
    on<SroEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
