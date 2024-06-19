import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wizo/Repostory/Api/Wizosecond_api.dart';

import '../Repostory/Model Class/WizoModelSecond.dart';

part 'second_event.dart';
part 'second_state.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  late WizoModelSecond  wizoModelSecond;
  WizosecondApi wizosecondApi=WizosecondApi();
  SecondBloc() : super(SecondInitial()) {
    on<FetchWizoEventsecond>((event, emit)async {
      emit(SecondBlocLoading());
      try{
        wizoModelSecond =await wizosecondApi.getWizosecond(event.id);
        emit(SecondBlocloaded());
      }
      catch(bb){
        emit(SecondBlocerror());
      }
      // TODO: implement event handler
    });
  }
}
