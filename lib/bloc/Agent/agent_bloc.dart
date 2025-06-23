import 'package:audit_info/Repositry/model/Agent_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'agent_event.dart';
part 'agent_state.dart';

class AgentBloc extends Bloc<AgentEvent, AgentState> {
  AgentBloc() : super(AgentInitial()) {
    on<fetchAgent>((event, emit) {

    });
  }
}
