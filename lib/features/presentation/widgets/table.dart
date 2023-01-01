import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/domain/entities/table_model.dart';
import 'package:statrco/features/presentation/constants.dart';
import 'package:statrco/features/presentation/cubit/table_cubit.dart';
import 'package:statrco/features/presentation/cubit/table_state.dart';
import 'package:statrco/features/presentation/widgets/tabletsCell.dart';

class TuringsTable extends StatefulWidget {
  TuringsTable({
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
          return DataTable(
            columnSpacing: 10,
            // horizontalMargin: 0,
            border: const TableBorder(
                verticalInside:
                    BorderSide(color: Color.fromRGBO(73, 50, 37, 0.102))),
            columns: state.states
                .where((element) => !(element == nullElement))
                .map<DataColumn>((e) =>
                    DataColumn(label: Expanded(child: Center(child: Text(e)))))
                .toList(),

            rows: state.A
                .where((element) => !(element == "" || element == nullElement))
                .map<DataRow>((a) => DataRow(
                    cells: state.states
                        .where((element) =>
                            !(element == nullElement))
                        .map<DataCell>((st) => DataCell(
                              st == ""
                                  ? Text("q$a")
                                  : TabletsCell(com: state.table[Pair(st, a)]!),
                            ))
                        .toList()))
                .toList(),
          );
        }
        return Text("нет таблицы");
      },
    );
  }
}
