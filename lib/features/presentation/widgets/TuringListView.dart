import 'package:flutter/material.dart';
import 'package:statrco/features/domain/entities/infinit_list_model.dart';
import 'package:statrco/features/presentation/widgets/listCell.dart';

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
    double t = oneMove * 5 - displayWidth(context) / 2 + oneMove / 2;

    return Container(
      color: const Color.fromARGB(255, 255, 240, 216),
      height: 77,
      child: Stack(
        children: [
          ListView.builder(
              // reverse: true,
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ListCell(
                  index: index,
                  list: list,
                );
              }),
          Positioned(
            top: 20,
            child: TextButton(
                onPressed: () {
                  // t -= oneMove;
                  controller.animateTo(t,
                      curve: Curves.elasticInOut,
                      duration: Duration(seconds: 1));
                },
                child: Text("ssssssss\nas")),
          ),
        ],
      ),
    );
  }
  void Move(){

  }
}
