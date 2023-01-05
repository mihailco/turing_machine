import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/domain/entities/table_model.dart';
import 'package:statrco/features/presentation/cubit/table_cubit.dart';
import 'package:statrco/features/presentation/cubit/table_state.dart';
import 'package:statrco/features/presentation/widgets/gear.dart';
import 'package:statrco/features/presentation/widgets/settings.dart';
import 'package:statrco/features/presentation/widgets/table.dart';
import 'package:statrco/features/presentation/widgets/tabletsCell.dart';

import '../../domain/entities/infinit_list_model.dart';
import '../constants.dart';
import '../cubit/turing_cubit.dart';
import '../cubit/turing_state.dart';
import '../widgets/TuringListView.dart';
import '../widgets/bottom_part_of_screen.dart';
import '../widgets/top_of_the_screen.dart';

class TuringMachinePage extends StatefulWidget {
  TuringMachinePage({Key? key}) : super(key: key);

  @override
  State<TuringMachinePage> createState() => _TuringMachinePageState();
}

class _TuringMachinePageState extends State<TuringMachinePage> {
  InfinitList list = InfinitList(<String>[], "λ");
  final ctrlList = ScrollController(initialScrollOffset: cellWidth * 100.5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          backgroundColor: Colors.black12,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    context.read<TuringCubit>().run();
                  },
                  icon: const Icon(Icons.play_arrow)),
              IconButton(
                  onPressed: () {
                    context.read<TuringCubit>().stop();
                  },
                  icon: const Icon(Icons.pause)),

              const Spacer(),

              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15)
                        )
                      ),
                      context: context, builder: ((context) => Settings()));
                  },
                  icon: const Icon(Icons.settings)),
            ],
          ),
        ),
        
        body: BlocBuilder<TuringCubit, oneStep>(
          builder: (context, state) {
            // context.read<TuringCubit>().init();

            return Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Stack(
                    children: [
                      Gear(radius: 15, clockwise: true),
                      TopOfTheScreen(ctrlList: ctrlList),
                    ],
                  ),
                ),
                const Flexible(flex: 2, child: BottomPartOfScreen()),
              ],
            );
          },
        ));
  }
}