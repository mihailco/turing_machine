import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/widgets/settings.dart';

import '../../domain/entities/infinit_list_model.dart';
import '../constants.dart';
import '../cubit/turing_cubit.dart';
import '../cubit/turing_state.dart';
import '../widgets/background_gears.dart';
import '../widgets/bottom_part_of_screen.dart';
import '../widgets/top_of_the_screen.dart';
import '../widgets/turing_history_widget.dart';

class TuringMachinePage extends StatefulWidget {
  const TuringMachinePage({Key? key}) : super(key: key);

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
            BlocBuilder<TuringCubit, OneStep>(
              builder: (context, state) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!state.running)
                      GestureDetector(
                        onDoubleTap: () {
                          context.read<TuringCubit>().run(emitAllSteps: false);
                        },
                        child: IconButton(
                            onPressed: () {
                              context.read<TuringCubit>().run();
                            },
                            icon: const Icon(Icons.play_arrow)),
                      )
                    else
                      IconButton(
                          onPressed: () {
                            context.read<TuringCubit>().stop();
                          },
                          icon: const Icon(Icons.pause)),
                    Text(state.stepNumber.toString())
                  ],
                );
              },
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15))),
                      context: context,
                      builder: ((context) => TuringHistoryW()));
                },
                icon: const Icon(Icons.history)),

            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15))),
                      context: context,
                      builder: ((context) => const Settings()));
                },
                icon: const Icon(Icons.settings)),
          ],
        ),
      ),
      body: Container(
        // decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/photos/background_top.png")) ),
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Stack(
                    children: [
                      const BackgroundGears(),
                      TopOfTheScreen(ctrlList: ctrlList),
                    ],
                  ),
                ),
                Container(
                    child: Flexible(flex: 2, child: BottomPartOfScreen())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
