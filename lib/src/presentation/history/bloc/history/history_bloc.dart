import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';



part 'history_event.dart';
part 'history_state.dart';


class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(): super(const HistoryState()) {
    on<HistoryEvent>((event, emit) {});
  }
}
