import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/cubit/turing_history_state.dart';
import 'package:statrco/features/presentation/widgets/scroll_beh.dart';

import '../cubit/turing_history_cubit.dart';

class TuringHistoryW extends StatelessWidget {
  TuringHistoryW({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TuringHistoryCubit, HistoryTuringState>(
      builder: (context, state) {
        return ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: DraggableScrollableSheet(
              maxChildSize: 0.6,
              // snap: true,
              expand: false,
              builder: (_, contr) {
                return Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                context.read<TuringHistoryCubit>().clear();
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))
                        ],
                      ),
                      Flexible(
                        child: ListView.separated(

                            // physics: NeverScrollableScrollPhysics(),
                            controller: contr,
                            itemBuilder: (BuildContext context, int index) {
                              final item = state.list[index];
                              if (item is StartAction) {
                                return Center(
                                    child: Text(
                                  item.time.toString(),
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 63, 94, 64)),
                                ));
                              }

                              if (item is StopAction) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(child: Text(item.time.toString())),
                                    Container(
                                      color: Colors.black,
                                      height: 2,
                                      padding: const EdgeInsets.all(12),
                                    )
                                  ],
                                );
                              }

                              if (item is OverwriteAction) {
                                return Row(
                                  children: [
                                    Text("$index."),
                                    Container(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                          "${item.from} перезаписано в ${item.to}"),
                                    ),
                                  ],
                                );
                              }

                              if (item is MoveAction) {
                                return Row(
                                  children: [
                                    Text("$index."),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("перемещение в ${item.to}"),
                                    ),
                                  ],
                                );
                              }

                              if (item is ChangeStateAction) {
                                return Row(
                                  children: [
                                    Text("$index."),
                                    Text("${item.from} изменено на ${item.to}"),
                                  ],
                                );
                              }

                              return const SizedBox();
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemCount: state.list.length),
                      ),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
