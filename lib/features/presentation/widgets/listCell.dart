import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/domain/entities/infinit_list_model.dart';
import 'package:statrco/features/presentation/cubit/table_cubit.dart';
import 'package:statrco/features/presentation/cubit/table_state.dart';

import '../constants.dart';

class ListCell extends StatefulWidget {
  const ListCell({super.key, required this.index, required this.list});
  final int index;
  final InfinitList list;
  @override
  State<ListCell> createState() => _ListCellState();
}

class _ListCellState extends State<ListCell> {
  @override
  Widget build(BuildContext context) {
    print(widget.list[widget.index]);
    return BlocBuilder<TableCubit, TableState>(
      builder: (context, state) {
        if (state is CurrentTableState) {
          return Container(
            width: listCellWidth,
            decoration: BoxDecoration(
              
              border: Border.all(width: 1, color: Colors.black)),
            margin: const EdgeInsets.all(2),
            child: Column(
              children: [
                DropdownButton<String>(
                    value: widget.list[widget.index],
                    items: state.A
                        .where((element) => element != "")
                        .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                        .toList(),
                    onChanged: (v) {
                      widget.list[widget.index] = v!;
                      setState(() {});
                    }),
                    Text("${widget.index}")
              ],
            ),
          );
        }
        return const Text("λ");
      },
    );
  }
}
