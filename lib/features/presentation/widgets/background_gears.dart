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
        //нижний левый угол
        Positioned(
            bottom: 22,
            child: Gear(
              speed: 10,
              scale: 1 / 3,
              darker: 0.3,
              initialtTurn: 1.5,
              typeGear: const BigGear(),
              clockwise: false,
            )),
        Positioned(
            left: 0,
            bottom: 0,
            child: Gear(
              speed: 10,
              scale: 1 / 3,
              darker: 0.3,
              initialtTurn: 0.1,
              typeGear: const SmallGear(),
              clockwise: true,
            )),
        Positioned(
          left: 89,
            bottom: 0,
            child: Gear(
              speed: 10,
              scale: 1 / 3,
              darker: 0.3,
              initialtTurn: 1.5,
              typeGear: const BigGear(),
            )),

        //сверху слева
        Positioned(
            top: 5,
            left: small.getSize() * small.getScale() - 55,
            child: Gear(
              darker: 0.8,
              initialtTurn: 1.5,
              typeGear: const BigGear(),
              clockwise: false,
            )),
        Positioned(
            top: 0, child: Gear(darker: 0.8, typeGear: const SmallGear())),
        Positioned(
            left: 86,
            top: 90,
            child: Gear(
              initialtTurn: 0.1,
              typeGear: const BigGear(),
            )),
        Positioned(
            left: big.getSize() * 3 + 60,
            top: 36,
            child: Gear(
              initialtTurn: 0.09,
              clockwise: false,
              typeGear: const BigGear(),
            )),
        //большая справа
        Positioned(
            right: -big.getSize() * 3,
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
