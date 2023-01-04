import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:statrco/features/domain/entities/infinit_list_model.dart';
import 'package:statrco/features/presentation/widgets/listCell.dart';
import 'package:statrco/features/presentation/widgets/scroll_beh.dart';

import '../constants.dart';

class TuringListView extends StatelessWidget {
  TuringListView({
    super.key,
    required this.list,
    this.controller,
  });
  final InfinitList list;
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  @override
  Widget build(BuildContext context) {
    double t = cellWidth * 5 - displayWidth(context) / 2 + cellWidth / 2;
    return Container(
      color: const Color.fromARGB(255, 255, 240, 216),
      height: 81,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
          
            // reverse: true,
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ListCell(
                index: index,
                list: list,
              );
            }),
      ),
    );
  }
}
