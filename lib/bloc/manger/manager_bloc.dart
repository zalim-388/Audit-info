import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:audit_info/Repositry/Api/manager/managerApi.dart';
import 'package:audit_info/Repositry/model/manager_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'manager_event.dart';
part 'manager_state.dart';

class ManagerBloc extends Bloc<ManagerEvent, ManagerState> {
  final ManagerApi managerapi = ManagerApi();
  List<Managermodel> manager = [];

  ManagerBloc() : super(ManagerInitial()) {
    on<fetchmanager>((event, emit) async {
      emit(ManagerBlocloading());
      try {
        manager = await managerapi.getManager();
        emit(ManagerBlocloaded(manager: manager));
      } catch (e) {
        print("manager error$e");
        emit(ManagerBlocError());
      }
    });

    on<Addmanager>((event, emit) async {
      emit(ManagerBlocloading());
      try {
        await managerapi.addManager(event.managerdata);
        manager = await managerapi.getManager();
        emit(ManagerBlocloaded(manager: manager));
      } catch (e) {
        print("manager add error$e");
        emit(ManagerBlocError());
      }
    });


on<DeleteManager>((evant,emit) async{
  emit(ManagerBlocloading());
try{
  await managerapi.DeleteManager(evant.id);
  manager= await managerapi.getManager();
  emit(ManagerBlocloaded(manager:manager));
} catch(e){
print("Manager add error: $e");
}
});

  }

  
}

