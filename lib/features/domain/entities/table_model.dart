import 'package:equatable/equatable.dart';

class Pair extends Equatable {
  final String state;
  final String A;

  Pair(this.state, this.A);

  @override
  List<Object?> get props => [state, A];
}

class CellCommand extends Equatable {
  late String? nextState;
  late String? rewrite;
  late String? moveTo;

  CellCommand(this.nextState, this.rewrite, this.moveTo);
  CellCommand.nil() {
    nextState = "";
    rewrite = "";
    moveTo = "";
  }

  @override
  List<Object?> get props => [nextState, rewrite, moveTo];
}
