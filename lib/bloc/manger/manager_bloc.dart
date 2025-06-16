import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:audit_info/Repositry/model/manager_model.dart';
import 'package:audit_info/Repositry/Api/manager/managerApi.dart';

part 'manager_event.dart';
part 'manager_state.dart';

class ManagerBloc extends Bloc<ManagerEvent, ManagerState> {
  List<Managermodel> manager = [];

  ManagerBloc() : super(ManagerInitial()) {
    on<fetchmanager>((event, emit) async {
      emit(ManagerBlocloading());
      try {
        final result = await ManagerApi().getManager();
        manager = result;
        emit(ManagerBlocloaded(manager: manager));
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
        manager = result;
        emit(ManagerBlocloaded(manager: manager));
      } catch (e) {
        print("Manager add error: $e");
        emit(ManagerBlocError());
      }
    });

    on<DeleteManager>((event, emit) async {
      emit(ManagerBlocloading());
      try {
        await ManagerApi().deleteManager(event.id);
        manager.removeWhere((m) => m.id == event.id);
        emit(ManagerBlocloaded(manager: manager));
      } catch (e) {
        print("Manager delete error: $e");
        emit(ManagerBlocError());
      }
    });
  }
}
