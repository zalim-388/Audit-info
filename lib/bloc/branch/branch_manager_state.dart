part of 'branch_manager_bloc.dart';

@immutable
sealed class BranchManagerState {}

final class BranchManagerBlocInitial extends BranchManagerState {}

final class BranchManagerBlocloading extends BranchManagerState {}

final class BranchManagerBlocloaded extends BranchManagerState {
  final Branchmodel branches;

  BranchManagerBlocloaded({required this.branches});
}

final class BranchManagerBlocError extends BranchManagerState {}
