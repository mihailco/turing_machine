import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/domain/entities/table_model.dart';
import 'package:statrco/features/presentation/cubit/table_cubit.dart';
import 'package:statrco/features/presentation/cubit/table_state.dart';
import 'package:statrco/features/presentation/cubit/turing_cubit.dart';
import 'package:statrco/features/presentation/cubit/turing_state.dart';
import 'package:statrco/features/presentation/widgets/tablets_cell.dart';

class TuringsTable extends StatefulWidget {
  const TuringsTable({
    Key? key,
  }) : super(key: key);

  @override
  State<TuringsTable> createState() => _TuringsTableState();
}

class _TuringsTableState extends State<TuringsTable> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableCubit, TableState>(
      builder: (context, state) {
        if (state is CurrentTableState) {
          return BlocBuilder<TuringCubit, OneStep>(
            builder: (contexTU, stateTU) {
              return DataTable(
                columnSpacing: 10,
                // horizontalMargin: 0,
                border: const TableBorder(
                    verticalInside:
                        BorderSide(color: Color.fromRGBO(73, 50, 37, 0.102))),
                columns: state.states
                    .map<DataColumn>((e) => DataColumn(
                        label: Expanded(child: Center(child: Text(e)))))
                    .toList(),

                rows: state.A
                    .where((element) => element != "")
                    .map<DataRow>((a) => DataRow(
                        cells: state.states
                            .map<DataCell>((st) => DataCell(
                                  st == ""
                                      ? Text(a)
                                      : Container(
                                          color: (stateTU.currentState == st&&stateTU.list[stateTU.indexInList]==a)
                                              ? const Color.fromARGB(24, 255, 255, 255)
                                              : Colors.transparent,
                                          child: TabletsCell(
                                              com: state.table[Pair(st, a)]!),
                                        ),
                                ))
                            .toList()))
                    .toList(),
              );
            },
          );
        }
        return const Text("нет таблицы");
      },
    );
  }
}
