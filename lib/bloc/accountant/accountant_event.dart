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
}

class UpdateAccount extends AccountantEvent {
  final Map<String, dynamic> updatedData;
  final String id;

  UpdateAccount({required this.updatedData, required this.id});
}
