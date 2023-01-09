import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/cubit/turing_cubit.dart';
import 'package:statrco/features/presentation/cubit/turing_state.dart';

class TypeGear {
  const TypeGear();
  double getSize() => 18;
  double getScale() => 1;

  String getAsset() => "assets/photos/gearB.png";
}

class SmallGear extends TypeGear {
  const SmallGear();

  @override
  double getSize() => 100;

  @override
  String getAsset() => "assets/photos/gearS.png";

  @override
  double getScale() => 1.2;
}

class BigGear extends TypeGear {
  const BigGear();
  @override
  double getSize() => 300;

  @override
  String getAsset() => "assets/photos/gearB.png";
}

class Gear extends StatelessWidget {
  Gear(
      {super.key,
      required this.typeGear,
      this.clockwise = true,
      this.connectedWith = const BigGear(),
      this.initialtTurn = 0,
      this.darker = 1,
      this.scale = 1,
      this.speed = 1});
  final TypeGear typeGear;
  final TypeGear connectedWith;
  final bool clockwise;
  final double initialtTurn;
  final double darker;
  final double scale;
  int prevIndex = 0;
  final double speed;
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
                    (connectedWith.getSize() / typeGear.getSize()) /
                    18 *
                    speed +
                initialtTurn,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Color.fromARGB(255, (255 * darker).toInt(),
                    (255 * darker).toInt(), (255 * darker).toInt()),
                BlendMode.modulate,
              ),
              child: Image.asset(
                typeGear.getAsset(),

                // color: const Color.fromARGB(255, 196, 168, 127),
                height: typeGear.getSize() * typeGear.getScale() * scale,
                width: typeGear.getSize() * typeGear.getScale() * scale,
                // fit: BoxFit.none,
              ),
            ));
      },
    );
  }
}
