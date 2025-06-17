part of 'sro_bloc.dart';

@immutable
sealed class SroState {}

final class SroInitial extends SroState {}

final class SroBlocloading extends SroState {}

final class sroBlocloaded extends SroState {
  final List<SroModel> SRO;

  sroBlocloaded({required this.SRO});
}

final class srcblocError extends SroState {}
