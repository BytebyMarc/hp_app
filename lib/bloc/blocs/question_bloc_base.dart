import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '../events/question_event_base.dart';
part '../states/question_state_base.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(QuestionInitial()) {
    on<QuestionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
