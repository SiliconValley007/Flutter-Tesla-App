import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int selectedIndex = 0;

  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isHoodLock = true;
  bool isBootLock = true;

  bool isCoolSelected = true;
  bool isShowTyre = false;
  bool showTyreStatus = false;

  void setCurrentTabIndex(int currentIndex) {
    selectedIndex = currentIndex;
    notifyListeners();
  }

  void toggleRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  void toggleLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void toggleHoodLock() {
    isHoodLock = !isHoodLock;
    notifyListeners();
  }

  void toggleBootLock() {
    isBootLock = !isBootLock;
    notifyListeners();
  }

  void toggleCoolSelected() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }

  void toggleShowTyre({required int index}) {
    // when user on the 3rd tab(tyre tab) we want to show the tyre
    if (selectedIndex != 3 && index == 3) {
      Future.delayed(
        const Duration(milliseconds: 400),
        () {
          isShowTyre = true;
          notifyListeners();
        },
      );
    } else {
      isShowTyre = false;
      notifyListeners();
    }
  }

  void toggleShowTyreStatus({required int index}) {
    if (selectedIndex != 3 && index == 3) {
      showTyreStatus = true;
      notifyListeners();
    } else {
      Future.delayed(
        const Duration(milliseconds: 400),
        () {
          showTyreStatus = false;
          notifyListeners();
        },
      );
    }
  }
}
