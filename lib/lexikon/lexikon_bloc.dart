import 'package:bloc/bloc.dart';

import '../models/lexikon_entry.dart';
import 'lexikon_event.dart';
import 'lexikon_state.dart';

class LexikonBloc extends Bloc<LexikonEvent, LexikonState> {
  LexikonBloc() : super(LexikonInitial()) {
    on<LoadLexikon>(_onLoadLexikon);
    add(const LoadLexikon());
  }

 Future<void> _onLoadLexikon(
     LoadLexikon event, Emitter<LexikonState> emit) async{
    emit(LexikonLoading());
    try{
      final entries = LexikonEntry.testEntries;
      emit(LexikonLoaded(entries));
    }catch (e){
      emit(LexikonError(e.toString()));
    }

 }

}
