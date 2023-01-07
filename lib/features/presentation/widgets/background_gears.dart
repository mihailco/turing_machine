import 'package:flutter/material.dart';
import 'package:statrco/features/presentation/widgets/gear.dart';

class BackgroundGears extends StatelessWidget {
  const BackgroundGears({super.key});
  final small = const SmallGear();
  final big = const SmallGear();
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
            top: 5,
            left: small.getDiameter() * small.getScale() - 55,
            child: Gear(
              darker: 0.8,
              initialtTurn: 1.5,
              typeGear: const BigGear(),
              clockwise: false,
            )),
        Positioned(
            top: 0, child: Gear(darker: 0.8, typeGear: const SmallGear())),
        Positioned(
            left: 135,
            top: 111,
            child: Gear(
              initialtTurn: 0.1,
              typeGear: const BigGear(),
            )),
        Positioned(
            left: big.getDiameter() * 3 + 108,
            top: 111,
            child: Gear(
              initialtTurn: 0.09,
              clockwise: false,
              typeGear: const BigGear(),
            )),
        Positioned(
            right: -big.getDiameter() * 3,
            child: Gear(
              speed: 1 / 5,
              scale: 2,
              darker: 0.4,
              initialtTurn: 0.09,
              typeGear: const BigGear(),
            )),
      ],
    );
  }
}
