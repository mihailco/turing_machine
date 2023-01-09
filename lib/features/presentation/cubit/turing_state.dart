import 'package:statrco/features/domain/entities/infinit_list_model.dart';

class OneStep {
  final int indexInList;
  final int stepNumber;
  final String currentState;
  final InfinitList list;
  final bool running;
  const OneStep(this.currentState, this.indexInList, this.list, this.running, this.stepNumber);

  List<Object?> get props =>
      [indexInList, currentState, list.list.toString(), running];
}
