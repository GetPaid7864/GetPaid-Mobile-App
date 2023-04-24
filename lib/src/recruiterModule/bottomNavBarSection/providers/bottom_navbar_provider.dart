import 'package:flutter/material.dart';
import 'package:get_paid/src/recruiterModule/chatSection/screens/chat_users_list_screen.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/screens/dashboard_screen.dart';
import 'package:get_paid/src/recruiterModule/jobSection/screens/jobs_screen.dart';
import 'package:get_paid/src/recruiterModule/profileSection/screens/my_profile_screen.dart';

import '../../searchingSection/screen/search_screen.dart';

class BottomNavProvider extends ChangeNotifier {
  Widget currentScreen = const DashBoardScreen();
  int currentIndex = 0;

  updateScreen(int index) {
    updateCurrentScreen(index);
  }

  updateCurrentScreen(int index) {
    switch (index) {
      case 0:
        currentIndex = index;
        currentScreen = const DashBoardScreen();
        notifyListeners();
        break;
      case 1:
        currentIndex = index;
        currentScreen = const ChatUsersListScreen();
        notifyListeners();
        break;
      case 2:
        currentIndex = index;
        currentScreen = const SearchScreen();
        notifyListeners();
        break;
      case 3:
        currentIndex = index;
        currentScreen = JobScreen();
        notifyListeners();
        break;
      case 4:
        currentIndex = index;
        currentScreen = const MyProfileScreen();
        notifyListeners();
        break;
    }
  }
}
