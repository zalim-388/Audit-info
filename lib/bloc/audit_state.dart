part of 'audit_bloc.dart';

@immutable
sealed class AuditState {}

class auditblocInitial extends AuditState {}

class auditblocLoading extends AuditState {}

class auditblocLoaded extends AuditState {}

class auditblocerror extends AuditState {}
