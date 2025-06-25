import 'package:audit_info/Repositry/Api/Adiministactor/Adiministactor_Api.dart';
import 'package:audit_info/Repositry/model/Adiministactor.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'adiministactor_event.dart';
part 'adiministactor_state.dart';

class AdiministactorBloc
    extends Bloc<AdiministactorEvent, AdiministactorState> {
  List<Adiministactormodel> adiministactors = [];
  AdiministactorBloc() : super(AdiministactorInitial()) {
    on<AdiministactorEvent>((event, emit) async {
      emit(AdiministactorInitial());
      try {
        final Adimi = await AdiministactorApi().getAdiministactor();
        emit(AdiministactorLoaded(adiministactors: Adimi));
      } catch (e) {
        emit(AdiministactorError(message: e.toString()));
      }
    });
on<AddAdimini>((event, emit) async {
      emit(AdiministactorLoading());
      try {
        await AdiministactorApi().AddAdimini(event.adiminiData);
        final adimi = await AdiministactorApi().getAdiministactor();
        emit(AdiministactorLoaded(adiministactors: adimi));
      } catch (e) {
        emit(AdiministactorError(message: e.toString()));
      }
    });

    on<DeleteAdimini>((event, emit) async {
      emit(AdiministactorLoading());
      try {
        await AdiministactorApi().DeleteAdimini(event.id);
        adiministactors.removeWhere((a) => a.id == event.id);
        emit(AdiministactorLoaded(adiministactors: adiministactors));
      } catch (e) {
        emit(AdiministactorError(message: e.toString()));
      }
    });

    on<UpdateAdimini>((event, emit) async {
      emit(AdiministactorLoading());
      try {
        await AdiministactorApi().UpdateAdimini(event.id, event.updatedata);
        final updatedAdimi = await AdiministactorApi().getAdiministactor();
        emit(AdiministactorLoaded(adiministactors: updatedAdimi));
      } catch (e) {
        emit(AdiministactorError(message: e.toString()));
      }
    });





  }
}
