import 'package:audit_info/Repositry/Api/Agent/AgentApi.dart';
import 'package:audit_info/Repositry/model/Agent_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'agent_event.dart';
part 'agent_state.dart';

class AgentBloc extends Bloc<AgentEvent, AgentState> {
  List<AgentModel> agent = [];
  AgentBloc() : super(AgentInitial()) {
    on<fetchAgent>((event, emit) async {
      emit(AgentBlocloading());
      try {
        final result = await Agentapi().getAgent();
        print("Fetched ${result.length} agents");
        emit(AgentBlocloaded(agent: result));
      } catch (e) {
        print("Agent fetch error: $e");
        emit(AgentBlocError(error: e.toString()));
      }
    });

    on<AddAgent>((event, emit) async {
      emit(AgentBlocloading());
      try {
        await Agentapi().addAgent(event.agentData);
        final addagent = await Agentapi().getAgent();
        emit(AgentBlocloaded(agent: addagent));
      } catch (e) {
        print("Agent add error: $e");
        emit(AgentBlocError(error:e.toString()));
      }
    });

 on<DeleteAgent>((event, emit) async {
      emit(AgentBlocloading());
      try {
        await Agentapi().deleteAgent(event.id);
        final updatedAgents = await Agentapi().getAgent(); 
        print("Fetched ${updatedAgents.length} agents after deletion");
        emit(AgentBlocloaded(agent: updatedAgents));
      } catch (e) {
        print("Agent delete error: $e");
        emit(AgentBlocError(error: e.toString()));
      }
    });
    on<updateAgent>((event, emit) async {
      emit(AgentBlocloading());
      try {
        await Agentapi().updateAgent(event.id, event.updatedata);
        final updatedAgents = await Agentapi().getAgent();
        emit(AgentBlocloaded(agent: updatedAgents));
      } catch (e) {
        print("API update error: $e");
        emit(AgentBlocError(error:e.toString()));
      }
    });
  }
}
