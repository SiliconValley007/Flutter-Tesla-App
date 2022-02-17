import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({
    Key? key,
    required this.onPressed,
    required this.isLocked,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedSwitcher(
        duration: defaultDuration,
        child: isLocked
            ? SvgPicture.asset(
                'assets/icons/door_lock.svg',
                key: const ValueKey('door_lock'),
              )
            : SvgPicture.asset(
                'assets/icons/door_unlock.svg',
                key: const ValueKey('door_unlock'),
              ),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        switchInCurve: Curves.easeInOutBack,
      ),
    );
  }
}
