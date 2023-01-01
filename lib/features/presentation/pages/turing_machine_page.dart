import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/domain/entities/table_model.dart';
import 'package:statrco/features/presentation/cubit/table_cubit.dart';
import 'package:statrco/features/presentation/cubit/table_state.dart';
import 'package:statrco/features/presentation/widgets/table.dart';
import 'package:statrco/features/presentation/widgets/tabletsCell.dart';

import '../../domain/entities/infinit_list_model.dart';
import '../constants.dart';
import '../cubit/turing_cubit.dart';
import '../cubit/turing_state.dart';
import '../widgets/TuringListView.dart';
import '../widgets/bottom_part_of_screen.dart';

class TuringMachinePage extends StatefulWidget {
  TuringMachinePage({Key? key}) : super(key: key);

  @override
  State<TuringMachinePage> createState() => _TuringMachinePageState();
}

class _TuringMachinePageState extends State<TuringMachinePage> {
  InfinitList list = InfinitList(<String>[], "λ");
  final ctrlList = ScrollController(initialScrollOffset: oneMove * 100.5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    context.read<TuringCubit>().execute();
                  },
                  icon: const Icon(Icons.play_arrow))
            ],
          ),
        ),
        body: BlocBuilder<TuringCubit, TuringState>(
          builder: (context, state) {
            context.read<TuringCubit>().init();

            return Column(
              children: [
                BlocBuilder<TuringCubit, Working>(
                  builder: (context, state) {
                    if(state.moves){
                       ctrlList.animateTo(
                        state.indexInList * oneMove -
                            displayWidth(context) / 2 +
                            oneMove / 2,
                        curve: Curves.elasticInOut,
                        duration: Duration(seconds: 1));
                    }
                   
                    // oneMove *5- displayWidth(context)/2+oneMove/2;
                    return Flexible(
                      flex: 3,
                      // child: Container(),
                      child: Center(
                          child: Column(
                        children: [
                          TuringListView(
                            list: state.list,
                            controller: ctrlList,
                          ),
                          Center(
                            child: Container(
                                height: 55,
                                width: 77,
                                child: Image.asset(
                                  "assets/photos/arrow.png",
                                  fit: BoxFit.contain,
                                )),
                          )
                        ],
                      )),
                    );
                  },
                ),
                const Flexible(
                  flex: 2,
                  child: BottomPartOfScreen(),
                ),
              ],
            );
          },
        ));
  }
}
