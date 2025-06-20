import 'package:audit_info/Repositry/Api/SRO/sroapi.dart';
import 'package:audit_info/Repositry/model/SRO_model.dart';
import 'package:audit_info/ui/SRO.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sro_event.dart';
part 'sro_state.dart';

class SroBloc extends Bloc<SroEvent, SroState> {
  List<SroModel> SRO = [];
  SroBloc() : super(SroInitial()) {
    on<fetchSro>((event, emit) async {
      emit(SroBlocloading());
      try {
        final result = await Sroapi().getsro();
        print("object${result.length}");
        emit(sroBlocloaded(SRO: result));
      } catch (e) {
        print("SRO fetch error: $e");
      }
    });

    on<Addsro>((event, emit) async {
      emit(SroBlocloading());
      try {
        final Addsro = await Sroapi().getsro();
        emit(sroBlocloaded(SRO: Addsro));
        await Sroapi().AddSro(event.srodata);
      } catch (e) {
        print("SRO add error: $e");
        emit(srcblocError());
      }
    });

    on<deletesro>((event, emit) async {
      emit(SroBlocloading());
      try {
        await Sroapi().deletesro(event.id);
        SRO.removeWhere((e) => e.id == event.id);
        emit(sroBlocloaded(SRO: SRO));
      } catch (e) {
        print("SRC delete error: $e");
        emit(srcblocError());
      }
    });

    on<updatesro>((event, emit) async {
      emit(SroBlocloading());

      try {
        await Sroapi().updatesro(event.id, event.updatedata);
        final update = await Sroapi().getsro();
        emit(sroBlocloaded(SRO: SRO));
      } catch (e) {
        print("APISRo update error: $e");
      }
    });
  }
}
