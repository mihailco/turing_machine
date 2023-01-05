import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:statrco/features/domain/entities/infinit_list_model.dart';
import 'package:statrco/features/presentation/constants.dart';
import 'package:statrco/features/presentation/cubit/table_state.dart';
import 'package:statrco/features/presentation/cubit/turing_state.dart';

import '../../domain/entities/table_model.dart';

class TuringCubit extends Cubit<oneStep> {
  TuringCubit(this.states, this.A, this.table, this.list)
      : super(oneStep(states[1], list.lastNN, list));
  late Duration time;
  final List<String> states;
  final List<String> A;
  final Map<Pair, CellCommand> table;
  final InfinitList list;
  int duration = 3000;

  bool running = false;

  late String curState = states[1];
  late int curPos = 0;

  void setDuration(int milliseconds) {
    duration = milliseconds;
  }

  void run() async {
    if (running) return;
    running = true;
    while (true) {
      if (!running || table[Pair(curState, list[curPos])]!.isNull()) {
        return;
      }
      await Future.delayed(Duration(milliseconds: duration), () {
        execute();
      });
    }
  }

  void stop() {
    running = false;
  }

  void setCurrrentPosition(int index) {
    curPos = index;
    emit(oneStep(curState, curPos, list));
  }

  void execute() {
    if (curPos == 0) {
      curPos = list.lastNN;
    }
    var cmd = table[Pair(curState, list[curPos])]!;
    if (cmd.rewrite != "") list[curPos] = cmd.rewrite!;
    if (cmd.nextState != "") curState = cmd.nextState!;
    if (cmd.moveTo != "") {
      if (cmd.moveTo == "L") {
        curPos--;
      }
      if (cmd.moveTo == "R") {
        curPos++;
      }
    }

    emit(oneStep(curState, curPos, list));
  }

  void clear() {
    curPos = 100;
    list.clear();
    emit(oneStep(curState, curPos, list));
  }
}
