part of 'branch_manager_bloc.dart';

@immutable
sealed class BranchManagerEvent {}

class fetchbranch extends BranchManagerEvent {}

class Addbranchmanager extends BranchManagerEvent {
  final List<BranchManagerBloc> branchmanagerdata;

  Addbranchmanager({required this.branchmanagerdata});
}
