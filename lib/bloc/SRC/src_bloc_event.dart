part of 'src_bloc_bloc.dart';

@immutable
sealed class SrcBlocEvent {}

class fetchsrc extends SrcBlocEvent {}

class AddSrc extends SrcBlocEvent {
  final Map<String, dynamic> srcdata;

  AddSrc({required this.srcdata});
}

class deletesrc extends SrcBlocEvent {
  final String id;

  deletesrc({required this.id});
}

class updatesrc extends SrcBlocEvent {
  final Map<String, dynamic> updatedData;
  final String id;

  updatesrc({required this.updatedData, required this.id});
}
