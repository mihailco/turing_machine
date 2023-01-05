import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/cubit/turing_cubit.dart';
import 'package:statrco/features/presentation/cubit/turing_state.dart';

class Gear extends StatelessWidget {
  Gear({super.key, required this.radius, this.clockwise = true});
  final double radius;
  late bool clockwise;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TuringCubit, oneStep>(
      builder: (context, state) {
        return AnimatedRotation(
            curve: Curves.elasticInOut,
            duration: Duration(
                milliseconds:
                    (context.read<TuringCubit>().duration * 3 / 4).toInt()),
            turns: state.indexInList.toDouble()/5,
            child: Container(
                height: radius * 10,
                width: radius * 10,
                child: Image.asset(
                  "assets/photos/gearB.png",
                  fit: BoxFit.contain,
                )));
      },
    );
  }
}
