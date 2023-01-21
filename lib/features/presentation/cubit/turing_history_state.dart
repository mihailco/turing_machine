class HistoryTuringState {
  final List<Actions> list;

  HistoryTuringState(this.list);

  List<Object?> get props => [list.length];
}

class Actions {}

///the Turing machine is up and running
class StartAction extends Actions {
  late DateTime time;

  StartAction() {
    time = DateTime.now();
  }
}

///the turing machine has stopped
class StopAction extends Actions {
  late DateTime time;

  StopAction() {
    time = DateTime.now();
  }
}

///overwrote the cell
class OverwriteAction extends Actions {
  final String from;
  final String to;
  OverwriteAction(this.from, this.to);
}

///the head of the machine has moved
class MoveAction extends Actions {
  final String to;
  MoveAction(this.to);
}

///the state has changed
class ChangeStateAction extends Actions {
  final String to;
  final String from;
  ChangeStateAction(this.from, this.to);
}
