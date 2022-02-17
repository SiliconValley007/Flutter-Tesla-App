import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';

class TempButton extends StatelessWidget {
  const TempButton({
    Key? key,
    required this.svgPath,
    required this.text,
    this.isActive = false,
    this.onPressed,
    this.activeColor = primaryColor,
  }) : super(key: key);

  final String svgPath, text;
  final bool isActive;
  final VoidCallback? onPressed;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          AnimatedContainer(
            duration: defaultDuration,
            curve: Curves.easeInOutBack,
            height: isActive ? 76 : 50,
            width: isActive ? 76 : 50,
            child: SvgPicture.asset(
              svgPath,
              color: isActive ? activeColor : Colors.white38,
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          AnimatedDefaultTextStyle(
            duration: defaultDuration,
            curve: Curves.easeInOutBack,
            style: TextStyle(
              fontSize: 16,
              color: isActive ? activeColor : Colors.white38,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(
              text.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
