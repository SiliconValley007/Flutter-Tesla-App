import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedTab,
    required this.onTap,
  }) : super(key: key);

  final int selectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedTab,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Lock.svg',
            color: selectedTab == 0 ? primaryColor : Colors.white54,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Charge.svg',
            color: selectedTab == 1 ? primaryColor : Colors.white54,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Temp.svg',
            color: selectedTab == 2 ? primaryColor : Colors.white54,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Tyre.svg',
            color: selectedTab == 3 ? primaryColor : Colors.white54,
          ),
          label: "",
        ),
      ],
    );
  }
}
