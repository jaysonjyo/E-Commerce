import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repostory/Api/WizoReview_api.dart';
import '../Repostory/Model Class/WizoReview.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  late WizoReviewModel wizoReviewModel;
  WizoreviewApi wizoreviewApi=WizoreviewApi();
  ReviewBloc() : super(ReviewInitial()) {
    on<FetchReviewEvent>((event, emit) async{
      emit(ReviewBlocLoading());
      try{
        wizoReviewModel = await wizoreviewApi.getwizoReview(event.id);
        emit(ReviewBlocloaded());
      }catch(cc){
        emit(ReviewBlocerror());

      }
      // TODO: implement event handler
    });
  }
}
