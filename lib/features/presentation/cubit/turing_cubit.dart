import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:statrco/features/domain/entities/infinit_list_model.dart';
import 'package:statrco/features/presentation/cubit/turing_state.dart';

import '../../domain/entities/table_model.dart';

class TuringCubit extends Cubit<OneStep> {
  TuringCubit(this.states, this.A, this.table, this.list)
      : super(OneStep(states[1], list.lastNN, list));
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
    if (curPos == 0) {
      curPos = list.lastNN;
    }
    if (curPos == 0) {
      curPos = 100;
    }
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
    emit(OneStep(curState, curPos, list));
  }

  void execute() {
    
    var cmd = table[Pair(curState, list[curPos])]!;
    if (cmd.rewrite != "") list[curPos] = cmd.rewrite;
    if (cmd.nextState != "") curState = cmd.nextState;
    if (cmd.moveTo != "") {
      if (cmd.moveTo == "L") {
        curPos--;
      }
      if (cmd.moveTo == "R") {
        curPos++;
      }
    }

    emit(OneStep(curState, curPos, list));
  }

  void clear() {
    curPos = 100;
    list.clear();
    emit(OneStep(curState, curPos, list));
  }
}
