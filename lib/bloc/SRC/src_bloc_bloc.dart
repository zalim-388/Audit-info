import 'package:audit_info/Repositry/Api/SRC/SRCapi.dart';
import 'package:audit_info/Repositry/model/SRCmodel.dart';
import 'package:audit_info/bloc/manger/manager_bloc.dart';
import 'package:audit_info/ui/SRC.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'src_bloc_event.dart';
part 'src_bloc_state.dart';

class SrcBlocBloc extends Bloc<SrcBlocEvent, SrcBlocState> {
  List<SrcModel> SRC = [];

  SrcBlocBloc() : super(SrcBlocInitial()) {
    on<fetchsrc>((event, emit) async {
      emit(SrcBlocloading());
      try {
        final newsrc = await Srcapi().getsrc();
        print("fetched ${newsrc.length} src");
        emit(srcBlocloaded(SRC: newsrc));
      } catch (e) {}
      ;
    });

    on<AddSrc>((event, emit) async {
      emit(SrcBlocloading());
      try {
        await Srcapi().AddSrc(event.srcdata);

        final AddSrc = await Srcapi().getsrc();
        SRC = AddSrc;
        emit(srcBlocloaded(SRC: SRC));
      } catch (e) {}
    });
    on<deletesrc>((event, emit) async {
      emit(SrcBlocloading());
      try {
        await Srcapi().deletesrc(event.id);
      } catch (e) {
        SRC.removeWhere((s) => s.id == event.id);
        emit(srcBlocloaded(SRC: SRC));
      }
    });
    on<updatesrc>((event, emit) async {
      emit(SrcBlocloading());
      try {
        await Srcapi().updatesrc(event.updatedData, event.id);
        final updatedSrc = await Srcapi().getsrc();
        emit(srcBlocloaded(SRC: updatedSrc));
      } catch (e) {}
    });
  }
}
