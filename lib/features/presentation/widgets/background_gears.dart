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
              initialtTurn: 1.5,
              typeGear: const BigGear(),
              clockwise: false,
            )),
        Positioned(
            top: 0, child: Gear(typeGear: const SmallGear(), clockwise: true)),
      ],
    );
  }
}
