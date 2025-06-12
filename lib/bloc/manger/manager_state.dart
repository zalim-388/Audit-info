part of 'manager_bloc.dart';

@immutable
sealed class ManagerState {}

final class ManagerInitial extends ManagerState {}
final class ManagerBlocloading extends ManagerState{}
final class ManagerBlocloaded extends ManagerState{
final List <Managermodel> manager;

  ManagerBlocloaded({required this.manager});

}
final class ManagerBlocError extends ManagerState{}
