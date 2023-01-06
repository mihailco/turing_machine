
import 'package:statrco/features/domain/entities/infinit_list_model.dart';



class OneStep  {
  final int indexInList;
  final String currentState;
  final InfinitList list;

  const OneStep(this.currentState, this.indexInList, this.list);

  List<Object?> get props => [indexInList, currentState, list.list.toString()];
}
