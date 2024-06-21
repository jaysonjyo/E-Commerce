part of 'wizo_bloc.dart';

@immutable
sealed class WizoEvent {}
class FetchWizoEvent extends WizoEvent {
final bool forAll;
final String searchKey;
FetchWizoEvent({required this.searchKey,required this.forAll});

}
