import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lexikon_event.dart';
part 'lexikon_state.dart';

class LexikonBloc extends Bloc<LexikonEvent, LexikonState> {
  LexikonBloc() : super(LexikonInitial()) {
    on<LoadLexikon>(_onLoadLexikon);
  }

 Future<void> _onLoadLexikon(
     LoadLexikon event, Emitter<LexikonState> emit) async{

    emit(LexikonLoading());
 }

}
