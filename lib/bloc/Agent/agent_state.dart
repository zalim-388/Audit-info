part of 'agent_bloc.dart';

@immutable
sealed class AgentState {}

final class AgentInitial extends AgentState {}

final class AgentBlocloading extends AgentState {}

final class AgentBlocloaded extends AgentState {
  final List<AgentModel> agent;

  AgentBlocloaded({required this.agent});
}

final class AgentBlocError extends AgentState {}
