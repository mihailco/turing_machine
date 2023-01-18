import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:statrco/features/presentation/constants.dart';
import 'package:statrco/features/presentation/cubit/table_state.dart';

import '../../domain/entities/table_model.dart';

///stores the set of internal states, the external alphabet and the table
class TableCubit extends Cubit<TableState> {
  final List<String> states = ["", "q0", "q1"];
  final List<String> A = ["", nullElement];
  late Map<Pair, CellCommand> table = {
    const Pair("q1", nullElement): CellCommand(states[0], A[0], "")
  };
  TableCubit()
      : super(CurrentTableState.withLists(
            const ["", "q0", "q1"],
            const ["", nullElement],
            {const Pair("q1", nullElement): CellCommand("", "", "")}));

//adds a state to the table 
  void addState(String newState) {
    if (states.contains(newState)) {
      int i = 0;
      String words = newState.replaceAll(RegExp("[0-9]"), "");
      while (states.contains(newState)) {
        i++;
        newState = "$words$i";
      }
    }

    List<String> tmp = List.from(states);
    tmp.add(newState);
    for (var element in A) {
      table[Pair(newState, element)] = CellCommand.nil();
    }
    /// emit(NullTableState());
    emit(CurrentTableState.withLists(tmp, A, table));
    states.add(newState);
  }

///adds a unique character to the external alphabet
  void addA(String newA) {
    if (A.contains(newA)) {
      int i = 0;
      String words = newA.replaceAll(RegExp("[0-9]"), "");
      while (A.contains(newA)) {
        i++;
        newA = "$words$i";
        newA = newA.substring(max(0, newA.length - 3));
      }
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
    states.addAll(["", "q1", "q0"]);
    A.clear();
    A.addAll(["", nullElement]);
    table.clear();
    table[const Pair("q1", nullElement)] = CellCommand(states[0], A[0], "");
    emit(CurrentTableState.withLists(states, A, table));
  }

  Map<String, dynamic> toJson() => {
        'states': states.toString(),
        'A': A.toString(),
        'table': table.toString(),
      };

  void fromJson(Map<String, dynamic> json) {
    states.clear();
    states.addAll(json["states"]!
        .toString()
        .replaceFirst("[", "")
        .replaceFirst("]", "")
        .split(", "));

    A.clear();
    A.addAll(json["A"]!
        .toString()
        .replaceFirst("[", "")
        .replaceFirst("]", "")
        .split(", "));

    table.clear();
    final t = json["table"]!
        .toString()
        .replaceAll("CellCommand", "")
        .replaceAll(RegExp("[{}(),:]"), "")
        .split("Pair")
        .where((element) => element != "")
        .toList();

    final splitted = List.generate(t.length, (index) => t[index].split(" "));
    splitted.forEach(
      (el) {
        table[Pair(el[0], el[1])] = CellCommand(el[2], el[3], el[4]);
      },
    );
    // table.addAll();
    emit(CurrentTableState.withLists(states, A, table));
  }
}
