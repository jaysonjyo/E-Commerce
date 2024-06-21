part of 'review_bloc.dart';

@immutable
sealed class ReviewEvent {}
class FetchReviewEvent extends ReviewEvent {
final String id;
FetchReviewEvent({required this.id});
}