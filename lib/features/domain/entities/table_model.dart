import 'package:equatable/equatable.dart';

class Pair extends Equatable {
  final String state;
  final String A;

  const Pair(this.state, this.A);

  @override
  List<Object?> get props => [state, A];
}

// ignore: must_be_immutable
class CellCommand extends Equatable {
  late String nextState;
  late String rewrite;
  late String moveTo;

  CellCommand(this.nextState, this.rewrite, this.moveTo);
  CellCommand.nil() {
    nextState = "";
    rewrite = "";
    moveTo = "";
  }

  bool isNull() {
    return nextState == ""  && moveTo == "";
  }

  @override
  List<Object?> get props => [nextState, rewrite, moveTo];
}
