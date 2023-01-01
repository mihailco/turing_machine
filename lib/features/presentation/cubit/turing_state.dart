// ignore_for_file: camel_case_types

import 'package:equatable/equatable.dart';
import 'package:statrco/features/domain/entities/infinit_list_model.dart';

abstract class TuringState extends Equatable {
  const TuringState();
  @override
  List<Object?> get props => [];
}

class Working extends TuringState {
  final int indexInList;
  final String currentState;
  final InfinitList list;
  final bool moves;

  const Working(this.currentState, this.indexInList, this.list, this.moves);

  @override
  List<Object?> get props => [indexInList, currentState, moves,list.position ];
}
