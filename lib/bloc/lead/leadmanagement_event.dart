part of 'leadmanagement_bloc.dart';

@immutable
sealed class LeadmanagementEvent {}

class fetchlead extends LeadmanagementEvent {}

class addlead extends LeadmanagementEvent {
  final Map<String, dynamic> leaddata;

  addlead({required this.leaddata});
}

class updatelead extends LeadmanagementEvent {
  final Map<String, dynamic> leaddata;
  final String leaDid;

  updatelead({required this.leaddata, required this.leaDid});
}

class deletelead extends LeadmanagementEvent {
  final String leaDid;

  deletelead({required this.leaDid});
}
