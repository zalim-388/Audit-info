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
