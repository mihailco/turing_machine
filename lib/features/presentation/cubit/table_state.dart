// ignore_for_file: camel_case_types

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/table_model.dart';

abstract class TableState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CurrentTableState extends TableState {
  final key = UniqueKey();
  final List<String> states;
  final Map<Pair, CellCommand> table;
  final List<String> A;
  CurrentTableState.withLists(this.states, this.A, this.table);

  @override
  List<Object?> get props =>
      [key];
}

class NullTableState extends TableState {}
