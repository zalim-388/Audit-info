part of 'manager_bloc.dart';

@immutable
sealed class ManagerEvent {}

class fetchmanager extends ManagerEvent {}

class Addmanager extends ManagerEvent {
  final Map<String, dynamic> managerdata;

  Addmanager({required this.managerdata});
}

class DeleteManager extends ManagerEvent {
  final String id;

  DeleteManager({required this.id});
}

class updatemanger extends ManagerEvent {
  final Map<String, dynamic> updatedata;
  final String id;

  updatemanger(this.id, {required this.updatedata});
}
