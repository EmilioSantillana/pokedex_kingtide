import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokeballProgressIndicator extends StatelessWidget {
  const PokeballProgressIndicator({
    super.key, 
    required this.pokeballSize, 
    required this.barRadius,
    required this.strokeWidth, 
  });

  final double pokeballSize;
  final double barRadius;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: pokeballSize,
      height: pokeballSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
              height: barRadius,
              width: barRadius,
              child: CircularProgressIndicator(
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                strokeWidth: strokeWidth,
              )),
          SvgPicture.asset(
            'assets/images/pokeball.svg',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
