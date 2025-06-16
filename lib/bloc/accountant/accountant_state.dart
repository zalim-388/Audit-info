part of 'accountant_bloc.dart';

@immutable
sealed class AccountantState {}

final class AccountantblocInitial extends AccountantState {}

final class Accountantblocloading extends AccountantState {}

final class Accountantblocloaded extends AccountantState {
  final List<AccountantModel> Account;

  Accountantblocloaded({required this.Account});
}

final class AccountantblocError extends AccountantState {
  
  
}
