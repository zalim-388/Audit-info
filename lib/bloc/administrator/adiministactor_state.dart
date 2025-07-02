part of 'adiministactor_bloc.dart';

@immutable
sealed class AdiministactorState {}

final class AdiministactorInitial extends AdiministactorState {}

final class AdiministactorLoading extends AdiministactorState {}

final class AdiministactorLoaded extends AdiministactorState {
  final List<Adiministactormodel> adiministactors;

  AdiministactorLoaded({required this.adiministactors});
}

final class AdiministactorError extends AdiministactorState {
  final String message;

  AdiministactorError({required this.message});
}
