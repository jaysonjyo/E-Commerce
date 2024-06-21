part of 'review_bloc.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}
class ReviewBlocLoading extends ReviewState{}
class ReviewBlocloaded extends ReviewState{}
class ReviewBlocerror extends ReviewState{}
