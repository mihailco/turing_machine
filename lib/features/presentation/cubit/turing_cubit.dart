import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:statrco/features/domain/entities/infinit_list_model.dart';
import 'package:statrco/features/presentation/cubit/table_cubit.dart';
import 'package:statrco/features/presentation/cubit/turing_history_cubit.dart';
import 'package:statrco/features/presentation/cubit/turing_history_state.dart';
import 'package:statrco/features/presentation/cubit/turing_state.dart';

import '../../domain/entities/table_model.dart';
import '../constants.dart';

class TuringCubit extends Cubit<OneStep> {
  TuringCubit(this.table, this.turingHistory)
      : super(OneStep(
            table.states[2], 100, InfinitList([], nullElement), false, 0));

  ///delay in milliseconds between steps
  late Duration time;

  final TuringHistoryCubit turingHistory;

  final TableCubit table;

  int duration = 666;
  late int maxSteps = 1000;
  bool running = false;

  final InfinitList list = InfinitList([], nullElement);

  late String curState = table.states[1];
  late int curPos = 0;

  void setDuration(int milliseconds) {
    duration = milliseconds;
  }

  ///performs a sequence of commands until one of the stop conditions is triggered
  void run({bool emitAllSteps = true}) async {
    turingHistory.add(StartAction());
    int step = 1;
    if (running) return;
    running = true;
    emit(OneStep(curState, curPos, list, running, step));

    if (curPos == 0) {
      curPos = list.lastNN;
    }
    if (curPos == 0) {
      curPos = 100;
    }
    curState = "q1";
    execute(step: step, emitThis: emitAllSteps);

    while (true) {
      if (!running ||
          table.table[Pair(curState, list[curPos])]!.isNull() ||
          step >= maxSteps) {
        running = false;
        emit(OneStep(curState, curPos, list, running, step));
        turingHistory.add(StopAction());

        return;
      }

      step++;
      await Future.delayed(Duration(milliseconds: emitAllSteps ? duration : 0),
          () {
        execute(step: step, emitThis: emitAllSteps);
      });
      if (curState == "q0") {
        running = false;
        emit(OneStep(curState, curPos, list, running, step));
        turingHistory.add(StopAction());

        return;
      }
    }
  }

  void stop() {
    running = false;
  }

  void setCurrrentPosition(int index) {
    turingHistory.add(MoveAction("$index"));

    curPos = index;
    emit(OneStep(curState, curPos, list, running, 0));
  }

  ///takes one step and sends a new state
  void execute({int step = 0, bool emitThis = true}) {
    var cmd = table.table[Pair(curState, list[curPos])]!;
    if (cmd.rewrite != "") {
      turingHistory.add(OverwriteAction(list[curPos], cmd.rewrite));

      list[curPos] = cmd.rewrite;
    }
    if (cmd.nextState != "") {
      turingHistory.add(ChangeStateAction(curState, cmd.nextState));

      curState = cmd.nextState;
    }
    if (cmd.moveTo != "") {
      if (cmd.moveTo == "L") {
        curPos--;
        turingHistory.add(MoveAction("L"));
      }
      if (cmd.moveTo == "R") {
        curPos++;
        turingHistory.add(MoveAction("R"));
      }
    }
    if (!emitThis) return;
    emit(OneStep(curState, curPos, list, running, step));
  }
///puts the maximum number of steps to a stop
  void setMaxSteps(int n) {
    maxSteps = n;
  }

  void clear() {
    curPos = 100;
    list.clear();
    emit(OneStep(curState, curPos, list, running, 0));
  }
}
