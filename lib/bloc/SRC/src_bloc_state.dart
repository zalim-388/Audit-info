part of 'src_bloc_bloc.dart';

@immutable
sealed class SrcBlocState {}

final class SrcBlocInitial extends SrcBlocState {}

final class SrcBlocloading extends SrcBlocState {}

final class srcBlocloaded extends SrcBlocState {
  final List <SrcModel> SRC;


  srcBlocloaded({required this.SRC});}

final class srcblocError extends SrcBlocState {}
