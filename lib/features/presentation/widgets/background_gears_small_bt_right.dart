import 'package:flutter/material.dart';
import 'package:statrco/features/presentation/widgets/gear.dart';

///gears are located at the bottom right and bottom left.
///They are now used at the bottom of the screen
class BackgroundGears2 extends StatelessWidget {
  const BackgroundGears2({super.key});
  final small = const SmallGear();
  final big = const SmallGear();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: -25,
            bottom: -25,
            child: Gear(
              speed: 5,
              scale: 1 / 3,
              darker: 0.8,
              initialtTurn: 1.5,
              typeGear: const BigGear(),
              clockwise: false,
            )),
        Positioned(
            right: -30,
            bottom: 110,
            child: Gear(
              speed: 5,
              scale: 1 / 3,
              darker: 0.5,
              initialtTurn: 1.516,
              typeGear: const BigGear(),
              clockwise: true,
            )),
        Positioned(
            right: 0,
            bottom: 22,
            child: Gear(
              speed: 5,
              scale: 1 / 3,
              darker: 0.5,
              initialtTurn: 1.5,
              typeGear: const BigGear(),
              clockwise: false,
            )),
        Positioned(
            right: 0,
            bottom: -3,
            child: Gear(
              speed: 5,
              scale: 1 / 3,
              darker: 0.5,
              initialtTurn: 0.1,
              typeGear: const SmallGear(),
            )),
        Positioned(
            right: 81,
            bottom: -14,
            child: Gear(
              speed: 5,
              scale: 1 / 3,
              darker: 0.5,
              initialtTurn: 1.5,
              typeGear: const BigGear(),
            )),
      ],
    );
  }
}
