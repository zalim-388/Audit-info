import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'audit_event.dart';
part 'audit_state.dart';

class AuditBloc extends Bloc<AuditEvent, AuditState> {
  AuditBloc() : super(auditblocInitial()) {
    on<AuditEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
