import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/domain/entities/table_model.dart';
import 'package:statrco/features/presentation/cubit/table_cubit.dart';
import 'package:statrco/features/presentation/cubit/table_state.dart';

class TabletsCell extends StatefulWidget {
  TabletsCell({
    Key? key,
    required this.com,
  }) : super(key: key);

  final CellCommand com;

  @override
  State<TabletsCell> createState() => _TabletsCellState();
}

class _TabletsCellState extends State<TabletsCell> {
  @override
  Widget build(BuildContext context) {
    List<String> move = ["","L", "R" ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //выбор переписывания значения
        BlocBuilder<TableCubit, TableState>(
          builder: (context, state) {
            if (state is CurrentTableState) {
              return DropdownButton<String>(
                  iconEnabledColor: Colors.black87,
                  value: widget.com.rewrite,
                  items: state.A
                      .map<DropdownMenuItem<String>>(
                          (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e.toString()),
                              ))
                      .toList(),
                  onChanged: (t) {
                    widget.com.rewrite = t;
                    setState(() {});
                  });
            }
            return const Text("data");
          },
        ),


 //выбор перемещения
        DropdownButton<String>(
            iconEnabledColor: const Color.fromARGB(221, 241, 165, 0),
            value: widget.com.moveTo,
            items: move
                .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e.toString()),
                        ))
                .toList(),
            onChanged: (t) {
              widget.com.moveTo = t;
              setState(() {});
            }),


        //выбор состояния
        BlocBuilder<TableCubit, TableState>(
          builder: (context, state) {
            if (state is CurrentTableState) {
              return DropdownButton<String>(
                  iconEnabledColor: Colors.black87,
                  value: widget.com.nextState,
                  items: state.states
                      .map<DropdownMenuItem<String>>(
                          (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e.toString()),
                              ))
                      .toList(),
                  onChanged: (t) {
                    widget.com.nextState = t;
                    setState(() {});
                  });
            }
            return const Text("data");
          },
        ),


       
      ],
    );
  }
}
