part of 'manager_bloc.dart';

@immutable
sealed class ManagerEvent {}
class fetchmanager extends ManagerEvent{}


// class Addbranchmanager extends ManagerEvent {
//   final Map<String, dynamic> managerdata;

//   Addbranchmanager({required this.managerdata});
// }