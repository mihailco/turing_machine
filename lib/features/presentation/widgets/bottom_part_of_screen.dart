import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/widgets/background_gears_small_bt_right.dart';
import 'package:statrco/features/presentation/widgets/table.dart';

import '../cubit/table_cubit.dart';

class BottomPartOfScreen extends StatelessWidget {
   BottomPartOfScreen({
    Key? key,
  }) : super(key: key);
final TextEditingController controller =TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(width: 3, color: Color.fromARGB(255, 58, 41, 29))),
        color: Color.fromARGB(40, 70, 0, 0),
        // Color.fromARGB(255, 177, 134, 75),
      ),
      child: Stack(
        children: [
          const BackgroundGears2(),
          InteractiveViewer(
            
            maxScale: 2,
            minScale: 0.0000001,
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
                          border: Border.all(
                              width: 3, color: const Color.fromRGBO(82, 59, 43, 1)),
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 185, 151, 103),
                        ),
                        child: const TuringsTable()),
                    IconButton(
                        onPressed: () {
                          // context.read<TableCubit>().addState("кью1");
                          context.read<TableCubit>().addState("q1");
                        },
                        icon: const Icon(Icons.plus_one_outlined)),
                  ],
                ),
          
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          context.read<TableCubit>().addA(controller.text);
                        },
                        icon: const Icon(Icons.plus_one_outlined)),
                        SizedBox(width: 155,
                          child: TextField(controller: controller,
                          onEditingComplete: () {
                             context.read<TableCubit>().addA(controller.text);
                          },
                          )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
