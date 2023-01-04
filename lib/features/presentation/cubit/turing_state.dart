// ignore_for_file: camel_case_types

import 'package:equatable/equatable.dart';
import 'package:statrco/features/domain/entities/infinit_list_model.dart';



class oneStep  {
  final int indexInList;
  final String currentState;
  final InfinitList list;

  const oneStep(this.currentState, this.indexInList, this.list);

  @override
  List<Object?> get props => [indexInList, currentState, list.list.toString()];
}
