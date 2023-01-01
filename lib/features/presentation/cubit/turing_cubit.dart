import 'package:bloc/bloc.dart';
import 'package:statrco/features/domain/entities/infinit_list_model.dart';
import 'package:statrco/features/presentation/cubit/table_state.dart';
import 'package:statrco/features/presentation/cubit/turing_state.dart';

import '../../domain/entities/table_model.dart';

class TuringCubit extends Cubit<Working> {
  TuringCubit(this.states, this.A, this.table, this.list)
      : super(Working(states[1], list.lastNN, list, false));
  late Duration time;
  final List<String> states;
  final List<String> A;
  final Map<Pair, CellCommand> table;
  final InfinitList list;
  void init() {
    curState = states[1];
    curPos = list.lastNN;
    table[Pair(curState, A[curPos])] =  CellCommand(states[1], A[0], "");
  }

  late String curState;
  late int curPos;
  void execute() {
    var cmd = table[Pair(curState, list[curPos])]!;
    if (cmd.rewrite != "") list[curPos] = cmd.rewrite!;
    if (cmd.nextState != "") curState = cmd.nextState!;
    if (cmd.moveTo != "") curPos = cmd.moveTo =="L" ?list.moveLeft():list.moveRight();

  emit(Working(curState, curPos, list, cmd.moveTo !=""));
  }
}
