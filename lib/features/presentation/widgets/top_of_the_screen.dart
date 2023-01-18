import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/constants.dart';
import 'package:statrco/features/presentation/cubit/turing_cubit.dart';
import 'package:statrco/features/presentation/widgets/turing_list_view.dart';

import '../cubit/turing_state.dart';

// ignore: must_be_immutable
class TopOfTheScreen extends StatelessWidget {
   TopOfTheScreen({
    Key? key,
    required this.ctrlList,
  }) : super(key: key);

    int lastIndex = 0;
  final ScrollController ctrlList;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TuringCubit, OneStep>(
      builder: (context, state) {
        if (ctrlList.hasClients) {
          int index = state.indexInList;
          if (index == 0) {
            index = 100;
          }

          double position =
              index * cellWidth 
              - displayWidth(context) / 2 + cellWidth / 2;

          if ((lastIndex - index).abs() > 100) {
            ctrlList.jumpTo(position);
          } else {
            ctrlList.animateTo(position,
                curve: Curves.elasticInOut,
                duration: Duration(
                    milliseconds:
                        (context.read<TuringCubit>().duration * (3 / 4))
                            .toInt()));
          }
          lastIndex = index;
        }

        // oneMove *5- displayWidth(context)/2+oneMove/2;
        return Container(
          padding: EdgeInsets.only(top: 15),
          child: Stack(
            // alignment: AlignmentDirectional.center,
            children: [
              TuringListView(
                list: state.list,
                controller: ctrlList,
              ),
              Stack(
                // fit: StackFit.expand,
                alignment: AlignmentDirectional.center,
                children: [
                  // Positioned(
                  //   top: 77,
                  //   child: SizedBox(
                  //       height: 55,
                  //       width: 77,
                  //       child: Image.asset(
                  //         "assets/photos/arrow.png",
                  //         fit: BoxFit.contain,
                  //       )),
                  // ),
                  Positioned(
                    top: 82,
                    child: SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset(
                          "assets/photos/machine.png",
                          fit: BoxFit.contain,
                        )),
                  ),
                  Positioned(
                      top: 140,
                      child: Text(
                        state.currentState,
                        style: const TextStyle(fontSize: 25),
                      ))
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
