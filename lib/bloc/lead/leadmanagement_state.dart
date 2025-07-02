part of 'leadmanagement_bloc.dart';

@immutable
sealed class LeadmanagementState {}

final class LeadmanagementInitial extends LeadmanagementState {}

final class LeadmanagementLoading extends LeadmanagementState {}

final class LeadmanagementLoaded extends LeadmanagementState {
  final List<LeadManagementModel> lead;

  LeadmanagementLoaded({required this.lead});
}

final class LeadmanagementError extends LeadmanagementState {
  final String message;
  LeadmanagementError(this.message);
}
