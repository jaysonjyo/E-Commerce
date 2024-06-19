part of 'wizo_bloc.dart';

@immutable
sealed class WizoState {}

final class WizoInitial extends WizoState {}
class WizoBlocLoading extends WizoState {}
class WizoBlocLoaded extends WizoState {}
class WizoBlocError extends WizoState {}