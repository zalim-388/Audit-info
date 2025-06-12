import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:audit_info/Repositry/Api/manager/managerApi.dart';
import 'package:audit_info/Repositry/model/manager_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manager_event.dart';
part 'manager_state.dart';

class ManagerBloc extends Bloc<ManagerEvent, ManagerState> {
  final Managerapi managerapi = Managerapi();
  late Managermodel manager;

  ManagerBloc() : super(ManagerInitial()) {
    on<fetchmanager>((event, emit) async {
      emit(ManagerBlocloading());
      try {
        manager = await managerapi.getManager();
        emit(ManagerBlocloaded(manager: []));
      } catch (e) {
        print("manager error$e");
        emit(ManagerBlocError());
      }
    });
  }
}


