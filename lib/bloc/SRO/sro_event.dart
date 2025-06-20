part of 'sro_bloc.dart';

@immutable
sealed class SroEvent {}

class fetchSro extends SroEvent {}

class Addsro extends SroEvent {
  final Map<String, dynamic> srodata;

  Addsro({required this.srodata});
}

class deletesro extends SroEvent {
  final String id;

  deletesro({required this.id});
}

class updatesro extends SroEvent {
  final Map<String, dynamic> updatedata;
  final String id;

  updatesro({required this.updatedata, required this.id});
}
