
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/widgets/table.dart';

import '../cubit/table_cubit.dart';

class BottomPartOfScreen extends StatelessWidget {
  const BottomPartOfScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 3,color: Color.fromARGB(255, 58, 41, 29))),
      color: 
      Color.fromARGB(81, 0, 0, 0),
      // Color.fromARGB(255, 177, 134, 75),
      ),
      child: InteractiveViewer(
        maxScale: 2,
        minScale: 0.001,
        constrained: false,
        boundaryMargin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3,color: const Color.fromRGBO(82, 59, 43, 1)),
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 154, 125, 83),
                    ),
                    child: TuringsTable()),
                IconButton(
                    onPressed: () {
                      // context.read<TableCubit>().addState("кью1");
                      context.read<TableCubit>().addState("q1");
                    },
                    icon: const Icon(Icons.plus_one_outlined)),
              ],
            ),
            // Container(
            //     width: 15,
            //     child: TextField(
            //       onEditingComplete: (() =>
            //           context.read<TableCubit>().addA("a")),
            //     )),
            IconButton(
                onPressed: () {
                  context.read<TableCubit>().addA("");
                },
                icon: const Icon(Icons.plus_one_outlined)),
          ],
        ),
      ),
    );
  }
}
