import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:statrco/features/domain/entities/infinit_list_model.dart';
import 'package:statrco/features/presentation/cubit/turing_state.dart';

import '../../domain/entities/table_model.dart';

class TuringCubit extends Cubit<OneStep> {
  TuringCubit(this.states, this.A, this.table, this.list)
      : super(OneStep(states[2], list.lastNN, list, false, 0));
  ///задержка в милисекундах между шагами
  late Duration time;
  final List<String> states;
  final List<String> A;
  final Map<Pair, CellCommand> table;
  final InfinitList list;
  int duration = 666;
  late int maxSteps = 1000;
  bool running = false;

  late String curState = states[1];
  late int curPos = 0;

  void setDuration(int milliseconds) {
    duration = milliseconds;
  }

  ///выполняет поседовательность команд до тех пор, пока не сработают условия остановки
  void run({bool emitAllSteps = true}) async {
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
          table[Pair(curState, list[curPos])]!.isNull() ||
          step >= maxSteps) {
        running = false;
        emit(OneStep(curState, curPos, list, running, step));
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
        return;
      }
    }
  }

  void stop() {
    running = false;
  }

  void setCurrrentPosition(int index) {
    curPos = index;
    emit(OneStep(curState, curPos, list, running, 0));
  }

  ///делает один шаг и отрпавяет новое состояние
  void execute({int step = 0, bool emitThis = true}) {
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
    if (!emitThis) return;
    emit(OneStep(curState, curPos, list, running, step));
  }

  void setMaxSteps(int n) {
    maxSteps = n;
  }

  void clear() {
    curPos = 100;
    list.clear();
    emit(OneStep(curState, curPos, list, running, 0));
  }
}
