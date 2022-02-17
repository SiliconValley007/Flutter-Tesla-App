import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/constants/constants.dart';
import 'package:tesla/models/tyrepsi.dart';

import '../../widgets/widgets.dart';
import '../screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _homeController = HomeController();
  late final AnimationController _animationController;
  late final Animation<double> _animationBatteryIcon;
  late final Animation<double> _animationBatteryStatus;

  late final AnimationController _tempAnimationController;
  late final Animation<double> _animationCarShift;
  late final Animation<double> _animationTempShowInfo;
  late final Animation<double> _animationCoolGlow;

  late final AnimationController _tyreAnimationController;
  late final Animation<double> _animationTyre1Psi;
  late final Animation<double> _animationTyre2Psi;
  late final Animation<double> _animationTyre3Psi;
  late final Animation<double> _animationTyre4Psi;

  late final List<Animation<double>> _tyreAnimations;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationBatteryIcon = CurvedAnimation(
      parent: _animationController,
      // so this animation starts at 0 and end at half of duration, meaning after 300 milliseconds.
      curve: const Interval(
        0.0,
        0.5,
      ),
    );
    _animationBatteryStatus = CurvedAnimation(
      parent: _animationController,
      // After delay we start this animation after 60 seconds delay, so it starts at 360 and end at 600 milliseconds.
      curve: const Interval(
        0.6,
        1,
      ),
    );
    _tempAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animationCarShift = CurvedAnimation(
      parent: _tempAnimationController,
      curve: const Interval(0.2, 0.4),
    );
    _animationTempShowInfo = CurvedAnimation(
      parent: _tempAnimationController,
      curve: const Interval(0.45, 0.65),
    );
    _animationCoolGlow = CurvedAnimation(
      parent: _tempAnimationController,
      curve: const Interval(0.7, 1),
    );
    _tyreAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animationTyre1Psi = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: const Interval(0, 0.16),
    );
    _animationTyre2Psi = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: const Interval(0.5, 0.66),
    );
    _animationTyre3Psi = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: const Interval(0.66, 0.82),
    );
    _animationTyre4Psi = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: const Interval(0.82, 1),
    );
    _tyreAnimations = [
      _animationTyre1Psi,
      _animationTyre2Psi,
      _animationTyre3Psi,
      _animationTyre4Psi,
    ];
  }

  @override
  void dispose() {
    _animationController.dispose();
    _tempAnimationController.dispose();
    _tyreAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // this animation needs listenable and ChangeNotifier extends Listenable
      animation: Listenable.merge([
        _homeController,
        _animationController,
        _tempAnimationController,
        _tyreAnimationController,
      ]),
      builder: (context, _) {
        return Scaffold(
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                    ),
                    Positioned(
                      left: constraints.maxWidth / 2 * _animationCarShift.value,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.1,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/Car.svg',
                          width: double.infinity,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: constraints.maxWidth *
                          (_homeController.selectedIndex == 0 ? 0.1 : 0.45),
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeController.selectedIndex == 0 ? 1 : 0,
                        child: DoorLock(
                          onPressed: _homeController.toggleRightDoorLock,
                          isLocked: _homeController.isRightDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      left: constraints.maxWidth *
                          (_homeController.selectedIndex == 0 ? 0.1 : 0.45),
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeController.selectedIndex == 0 ? 1 : 0,
                        child: DoorLock(
                          onPressed: _homeController.toggleLeftDoorLock,
                          isLocked: _homeController.isLeftDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: constraints.maxWidth *
                          (_homeController.selectedIndex == 0 ? 0.2 : 0.6),
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeController.selectedIndex == 0 ? 1 : 0,
                        child: DoorLock(
                          onPressed: _homeController.toggleHoodLock,
                          isLocked: _homeController.isHoodLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      bottom: constraints.maxWidth *
                          (_homeController.selectedIndex == 0 ? 0.25 : 0.6),
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeController.selectedIndex == 0 ? 1 : 0,
                        child: DoorLock(
                          onPressed: _homeController.toggleBootLock,
                          isLocked: _homeController.isBootLock,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animationBatteryIcon.value,
                      child: SvgPicture.asset(
                        'assets/icons/Battery.svg',
                        width: constraints.maxWidth * 0.35,
                      ),
                    ),
                    Positioned(
                      top: 50 * (1 - _animationBatteryStatus.value),
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Opacity(
                        opacity: _animationBatteryStatus.value,
                        child: BatteryStatus(
                          constraints: constraints,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60 * (1 - _animationTempShowInfo.value),
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Opacity(
                        opacity: _animationTempShowInfo.value,
                        child: TempDetails(homeController: _homeController),
                      ),
                    ),
                    Positioned(
                      right: -180 * (1 - _animationCoolGlow.value),
                      child: AnimatedSwitcher(
                        duration: defaultDuration,
                        child: _homeController.isCoolSelected
                            ? Image.asset(
                                'assets/images/Cool_glow_2.png',
                                key: const ValueKey('cool_glow_png'),
                                width: 200,
                              )
                            : Image.asset(
                                'assets/images/Hot_glow_4.png',
                                key: const ValueKey('Hot_glow_png'),
                                width: 200,
                              ),
                      ),
                    ),
                    if (_homeController.isShowTyre) ...tyres(constraints),
                    if (_homeController.showTyreStatus)
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: defaultPadding,
                          crossAxisSpacing: defaultPadding,
                          childAspectRatio:
                              constraints.maxWidth / constraints.maxHeight,
                        ),
                        itemBuilder: (context, index) => ScaleTransition(
                          scale: _tyreAnimations[index],
                          child: TyrePsiCard(
                            isBottomTyre: index > 1,
                            tyrePsi: demoPsiList[index],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(
            onTap: (value) {
              if (value == 1) {
                _animationController.forward();
              } else if (_homeController.selectedIndex == 1 && value != 1) {
                _animationController.reverse(from: 0.7);
              }
              if (value == 2) {
                _tempAnimationController.forward();
              } else if (_homeController.selectedIndex == 2 && value != 2) {
                _tempAnimationController.reverse(from: 0.4);
              }
              if (value == 3) {
                _tyreAnimationController.forward();
              } else if (_homeController.selectedIndex == 3 && value != 3) {
                _tyreAnimationController.reverse();
              }
              _homeController.toggleShowTyre(index: value);
              _homeController.toggleShowTyreStatus(index: value);
              _homeController.setCurrentTabIndex(value);
            },
            selectedTab: _homeController.selectedIndex,
          ),
        );
      },
    );
  }
}
