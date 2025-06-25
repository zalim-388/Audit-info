part of 'agent_bloc.dart';

@immutable
sealed class AgentEvent {}

class fetchAgent extends AgentEvent {}

class AddAgent extends AgentEvent {
  final Map<String, dynamic> agentData;

  AddAgent({required this.agentData});
}

class DeleteAgent extends AgentEvent {
  final String id;

  DeleteAgent({required this.id});
}
class updateAgent extends AgentEvent {
  final Map<String, dynamic> updatedata;
  final String id;

  updateAgent({required this.updatedata, required this.id});


}