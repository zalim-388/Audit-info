import 'package:audit_info/repository/Api/lead/lead_management.dart';
import 'package:audit_info/repository/model/lead_management.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'leadmanagement_event.dart';
part 'leadmanagement_state.dart';

class LeadmanagementBloc
    extends Bloc<LeadmanagementEvent, LeadmanagementState> {
  List<LeadManagementModel> lead = [];
  LeadmanagementBloc() : super(LeadmanagementInitial()) {
    on<fetchlead>((event, emit) async {
      emit(LeadmanagementLoading());
      try {
        final fetch = await LeadManagementApi().getLeadManagement();
        print("fetch${fetch.length} lead");
        emit(LeadmanagementLoaded(lead: fetch));
      } catch (e) {
        print("fetch lead error:$e");
        emit(LeadmanagementError(e.toString()));
      }
    });

    on<addlead>((event, emit) async {
      emit(LeadmanagementLoading());
      try {
        await LeadManagementApi().Addlead(event.leaddata);
        final Add = await LeadManagementApi().getLeadManagement();
        emit(LeadmanagementLoaded(lead: Add));
      } catch (e) {
        print("add lead error:$e");
        emit(LeadmanagementError(e.toString()));
      }
    });

    on<deletelead>((event, emit) async {
      emit(LeadmanagementLoading());
      try {
        await LeadManagementApi().deletelead(event.leaDid);
        final delete = await LeadManagementApi().getLeadManagement();
        emit(LeadmanagementLoaded(lead: delete));
      } catch (e) {
        print("delete lead error:$e");
        emit(LeadmanagementError(e.toString()));
      }
    });

    on<updatelead>((event, emit) async {
      emit(LeadmanagementLoading());
      try {
        await LeadManagementApi().updatelead(event.leaddata, event.leaDid);
        final update = await LeadManagementApi().getLeadManagement();
        emit(LeadmanagementLoaded(lead: update));
      } catch (e) {
        print("update lead error:$e");
        emit(LeadmanagementError(e.toString()));
      }
    });
  }
}
