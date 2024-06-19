part of 'second_bloc.dart';

@immutable
sealed class SecondState {}

final class SecondInitial extends SecondState {}
class SecondBlocLoading extends SecondState{}
class SecondBlocloaded extends SecondState{}
class SecondBlocerror extends SecondState{}
