import 'package:bloc/bloc.dart';
import 'package:statrco/features/presentation/constants.dart';
import 'package:statrco/features/presentation/cubit/table_state.dart';

import '../../domain/entities/table_model.dart';

class TableCubit extends Cubit<TableState> {
  final List<String> states;
  final List<String> A;
  final Map<Pair, CellCommand> table;
  TableCubit(this.states, this.A, this.table)
      : super(CurrentTableState.withLists(states, A, table));

  void addState(String newState) {
    if (states.contains(newState)) {
      newState =
          newState.replaceAll(RegExp("[0-9]"), "") + states.length.toString();
    }

    List<String> tmp = List.from(states);
    tmp.add(newState);
    for (var element in A) {
      table[Pair(newState, element)] = CellCommand.nil();
    }
    // emit(NullTableState());
    emit(CurrentTableState.withLists(tmp, A, table));
    states.add(newState);
  }

  void addA(String newA) {
    if (A.contains(newA)) {
      newA = newA.replaceAll(RegExp("[0-9]"), "") + (A.length - 2).toString();
    }

    List<String> tmp = List.from(A);
    tmp.add(newA);
    for (var element in states) {
      table[Pair(element, newA)] = CellCommand.nil();
    }
    emit(CurrentTableState.withLists(states, tmp, table));
    A.add(newA);
  }

  void clear() {
    states.clear();
    states.addAll(["", "q1"]);
    A.clear();
    A.addAll(["", nullElement]);
    table.clear();
    table[Pair("q1", nullElement)] = CellCommand(states[0], A[0], "");
    emit(CurrentTableState.withLists(states, A, table));
  }
}
