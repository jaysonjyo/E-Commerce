part of 'second_bloc.dart';

@immutable
sealed class SecondEvent {}
class FetchWizoEventsecond extends SecondEvent{
final String id;
FetchWizoEventsecond({required this.id});
}
