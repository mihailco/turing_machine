import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/cubit/turing_cubit.dart';
import 'package:statrco/features/presentation/cubit/turing_state.dart';

class TypeGear {
  const TypeGear();
  double getDiameter() => 18;
  double getScale() => 1;

  String getAsset() => "assets/photos/gearB.png";
}

class SmallGear extends TypeGear {
  const SmallGear();

  @override
  double getDiameter() => 100;

  @override
  String getAsset() => "assets/photos/gearS.png";

  @override
  double getScale() => 1.2;

}

class BigGear extends TypeGear {
  const BigGear();
  @override
  double getDiameter() => 300;

  @override
  String getAsset() => "assets/photos/gearB.png";
}

class Gear extends StatelessWidget {
  Gear(
      {super.key,
      required this.typeGear,
      this.clockwise = true,
      this.connectedWith = const BigGear(),
      this.initialtTurn = 0});
  final TypeGear typeGear;
  final TypeGear connectedWith;
  final bool clockwise;
  final double initialtTurn;
  int prevIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TuringCubit, OneStep>(
      builder: (context, state) {
        return AnimatedRotation(
            curve: Curves.elasticInOut,
            duration: Duration(
                milliseconds: context.read<TuringCubit>().duration * 3 ~/ 4),
            turns: state.indexInList.toDouble() *
                    (clockwise ? -1 : 1) *
                    (connectedWith.getDiameter() / typeGear.getDiameter()) /
                    18 +
                initialtTurn,
            child: Image.asset(
              typeGear.getAsset(),
              height: typeGear.getDiameter()*typeGear.getScale(),
              width: typeGear.getDiameter()*typeGear.getScale(),
              // fit: BoxFit.none,
            ));
      },
    );
  }
}
