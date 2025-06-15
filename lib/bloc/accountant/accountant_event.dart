part of 'accountant_bloc.dart';

@immutable
sealed class AccountantEvent {}

class fetchAccountant extends AccountantEvent {}

class AddAccount extends AccountantEvent {
  final Map<String, dynamic> Accountdata;

  AddAccount({required this.Accountdata});
}

class deleteaccount extends AccountantEvent {
  final String id;



  deleteaccount({required this.id});
}class UpdateAccountStatus extends AccountantEvent {
  final String id;
  final bool status;
  UpdateAccountStatus({required this.id, required this.status});
}
