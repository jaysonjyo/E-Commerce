import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repostory/Api/Wizo_api.dart';
import '../Repostory/Model Class/WizoModel.dart';

part 'wizo_event.dart';
part 'wizo_state.dart';

class WizoBloc extends Bloc<WizoEvent, WizoState> {
  late WizoModel wizoModel;
  WizoApi wizoApi = WizoApi();
  WizoBloc() : super(WizoInitial()) {
    on<FetchWizoEvent>((event, emit) async {
      emit(WizoBlocLoading());
      try{
        wizoModel =await wizoApi.getWizo(event.forAll,event.searchKey);
         emit (WizoBlocLoaded());

      }catch(aa){
        emit(WizoBlocError());
      }
      // TODO: implement event handler
    });
  }
}
