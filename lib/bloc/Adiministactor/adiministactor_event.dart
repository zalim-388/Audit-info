part of 'adiministactor_bloc.dart';

@immutable
sealed class AdiministactorEvent {}

class fetchAdiministactor extends AdiministactorEvent {}

class AddAdimini extends AdiministactorEvent {
final Map<String, dynamic> adiminiData;

  AddAdimini({required this.adiminiData});
}

class DeleteAdimini extends AdiministactorEvent {
  final String id;

  DeleteAdimini({required this.id});
}

class UpdateAdimini extends AdiministactorEvent {
  final Map<String, dynamic> updatedata;
  final String id;

  UpdateAdimini({required this.updatedata, required this.id});
}
