import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:audit_info/repository/model/manager_model.dart';
import 'package:audit_info/repository/Api/manager/managerApi.dart';

part 'manager_event.dart';
part 'manager_state.dart';

class ManagerBloc extends Bloc<ManagerEvent, ManagerState> {
  List<Managermodel> manager = [];

  ManagerBloc() : super(ManagerInitial()) {
    on<fetchmanager>((event, emit) async {
      emit(ManagerBlocloading());
      try {
        final result = await ManagerApi().getManager();
        print("Fetch${result.length} mangaer");
        emit(ManagerBlocloaded(manager: result));
      } catch (e) {
        print("Manager fetch error: $e");
        emit(ManagerBlocError());
      }
    });

    on<Addmanager>((event, emit) async {
      emit(ManagerBlocloading());
      try {
        await ManagerApi().addManager(event.managerdata);
        final result = await ManagerApi().getManager();
         emit(ManagerBlocloaded(manager: result));
      } catch (e) {
        print("Manager add error: $e");
        emit(ManagerBlocError());
      }
    });

    on<DeleteManager>((event, emit) async {
      emit(ManagerBlocloading());
      try {
        await ManagerApi().deleteManager(event.id);
        final updatedelete = await ManagerApi().getManager();
        print("Fetched ${updatedelete.length} manager after deletion");
        emit(ManagerBlocloaded(manager: updatedelete));
      } catch (e) {
        print("Manager delete error: $e");
        emit(ManagerBlocError());
      }
    });

    on<updatemanger>((event, emit) async {
      emit(ManagerBlocloading());
      try {
        await ManagerApi().updatemanger(event.updatedata, event.id);
        final result = await ManagerApi().getManager();
        emit(ManagerBlocloaded(manager: result));
      } catch (e) {
        print("API update error: $e");
        emit(ManagerBlocError());
      }
    });
  }
}
