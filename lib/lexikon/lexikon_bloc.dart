import 'package:bloc/bloc.dart';

import '../models/lexikon_entry.dart';
import 'lexikon_event.dart';
import 'lexikon_state.dart';

class LexikonBloc extends Bloc<LexikonEvent, LexikonState> {
  final List<LexikonEntry> _allentries = [];

  LexikonBloc() : super(LexikonInitial()) {
    on<LoadLexikon>(_onLoadLexikon);
    on<SearchLexikon>(_onSearch);
  }

 Future<void> _onLoadLexikon(
     LoadLexikon event, Emitter<LexikonState> emit) async{
    emit(const LexikonLoading());
    _allentries..clear()..addAll(LexikonEntry.testEntries);
    emit(LexikonLoaded(List.from(_allentries)));
 }

 void _onSearch(SearchLexikon event, Emitter<LexikonState> emit){
    final lower = event.query.toLowerCase();
    final filtered = _allentries.where((e) => e.term.toLowerCase().contains(lower)).toList();
    emit(LexikonLoaded(filtered));

 }


}
