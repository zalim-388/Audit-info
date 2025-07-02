import 'package:audit_info/repository/Api/SRC/SRCapi.dart';
import 'package:audit_info/repository/model/SRCmodel.dart';
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
      } catch (e) {
        print("SRC fetch error: $e");
        emit(srcblocError());
      }
      ;
    });

    on<AddSrc>((event, emit) async {
      emit(SrcBlocloading());
      try {
        await Srcapi().AddSrc(event.srcdata);

        final AddSrc = await Srcapi().getsrc();
        SRC = AddSrc;
        emit(srcBlocloaded(SRC: SRC));
      } catch (e) {
        print("SRC add error: $e");
        emit(srcblocError());
      }
    });
    on<deletesrc>((event, emit) async {
      emit(SrcBlocloading());
      try {
        await Srcapi().deletesrc(event.id);

        final updatedelete = await Srcapi().getsrc();
         print("Fetched ${updatedelete.length} agents after deletion");
        emit(srcBlocloaded(SRC: updatedelete));

      } catch (e) {
        print("SRC delete error: $e");
        emit(srcblocError());
      }
    });
    on<updatesrc>((event, emit) async {
      emit(SrcBlocloading());
      try {
        await Srcapi().updatesrc(event.updatedData, event.id);
        final updatedSrc = await Srcapi().getsrc();
        emit(srcBlocloaded(SRC: updatedSrc));
      } catch (e) {
        print("API update error: $e");
        emit(srcblocError());
      }
    });
  }
}
