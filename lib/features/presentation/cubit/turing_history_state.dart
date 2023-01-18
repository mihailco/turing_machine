import 'package:equatable/equatable.dart';

class HistoryTuringState {
  final List<Actions> list;

  HistoryTuringState(this.list);

  List<Object?> get props => [list.length];
}

class Actions {}

class StartAction extends Actions {
  late DateTime time;

  StartAction() {
    time = DateTime.now();
  }
}

class StopAction extends Actions {
  late DateTime time;

  StopAction() {
    time = DateTime.now();
  }
}

class OverwriteAction extends Actions {
  final String from;
  final String to;
  OverwriteAction(this.from, this.to);
}

class MoveAction extends Actions {
  final String to;
  MoveAction(this.to);
}

class ChangeStateAction extends Actions {
  final String to;
  final String from;
  ChangeStateAction(this.from, this.to);
}
