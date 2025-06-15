import 'dart:convert';

import 'package:audit_info/Repositry/model/manager_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'manager_event.dart';
part 'manager_state.dart';

class ManagerBloc extends Bloc<ManagerEvent, ManagerState> {
  
  List<Managermodel> manager = [];
  static const String _managersKey = 'managers';

  ManagerBloc() : super(ManagerInitial()) {
    on<fetchmanager>((event, emit) async {
      emit(ManagerBlocloading());
      try {
        final prefs = await SharedPreferences.getInstance();
        final String? managersJson = prefs.getString(_managersKey);
        if (managersJson != null) {
          final List<dynamic> jsonList = jsonDecode(managersJson);
          manager =
              jsonList.map((json) => Managermodel.fromJson(json)).toList();
        } else {
          manager = [];
        }
        emit(ManagerBlocloaded(manager: manager));
      } catch (e) {
        print("Manager fetch error: $e");
        emit(ManagerBlocError());
      }
    });
    on<Addmanager>((event, emit) async {
      emit(ManagerBlocloading());
      try {
        final prefs = await SharedPreferences.getInstance();

        final newManager = Managermodel(
          id: event.managerdata['id']?.toString() ?? "",
          employeeCode: event.managerdata['employeeCode']?.toString() ?? '',
          dateOfJoining:
              DateTime.tryParse(
                event.managerdata['dateOfJoining']?.toString() ?? '',
              ) ??
              DateTime.now(),
          name: event.managerdata['name']?.toString() ?? '',
          email: event.managerdata['email']?.toString() ?? '',
          address: event.managerdata['address']?.toString() ?? '',
          phoneNumber:
              event.managerdata['phoneNumber'] != null
                  ? int.tryParse(event.managerdata['phoneNumber'].toString()) ??
                      0
                  : 0,
          password: event.managerdata['password']?.toString() ?? '',
          pointAmount:
              event.managerdata['pointAmount'] != null
                  ? int.tryParse(event.managerdata['pointAmount'].toString()) ??
                      0
                  : 0,
          salary:
              event.managerdata['salary'] != null
                  ? int.tryParse(event.managerdata['salary'].toString()) ?? 0
                  : 0,
          position: event.managerdata['position']?.toString() ?? '',
          refresh:
              event.managerdata['refresh'] is bool
                  ? event.managerdata['refresh']
                  : (event.managerdata['refresh']?.toString().toLowerCase() ==
                      'true'),
          v:
              event.managerdata['v'] != null
                  ? int.tryParse(event.managerdata['v'].toString()) ?? 0
                  : 0,
        );
        manager.add(newManager);

        await prefs.setString(
          _managersKey,
          jsonEncode(manager.map((m) => m.toJson()).toList()),
        );
        emit(ManagerBlocloaded(manager: manager));
      } catch (e) {
        print("Manage  add error: $e");
        emit(ManagerBlocError());
      }
    });
    on<DeleteManager>((event, emit) async {
      emit(ManagerBlocloading());
      try {
        final prefs = await SharedPreferences.getInstance();
        manager.removeWhere((m) => m.id == event.id);
        // Save updated list
        await prefs.setString(
          _managersKey,
          jsonEncode(manager.map((m) => m.toJson()).toList()),
        );
        emit(ManagerBlocloaded(manager: manager));
      } catch (e) {
        print("Manager delete error: $e");
        emit(ManagerBlocError());
      }
    });
  }
}
