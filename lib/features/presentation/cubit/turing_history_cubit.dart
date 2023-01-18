
import 'package:bloc/bloc.dart';
import 'package:statrco/features/presentation/cubit/turing_history_state.dart';

class TuringHistoryCubit extends Cubit<HistoryTuringState> {
  TuringHistoryCubit():super(HistoryTuringState([]));
  final List<Actions> list =[];

    void add(Actions t) {
    emit(HistoryTuringState([...list, t]));
    list.add(t);
  }

  void clear() {
    emit(HistoryTuringState([]));
    list.clear();
  }
}
