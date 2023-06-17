import 'package:flutter/material.dart';
import 'package:get_paid/src/jobSeekerModule/chatSection/screens/jobseeker_chat_list_screen.dart';
import 'package:get_paid/src/jobSeekerModule/contractsSection/screens/jobseeker_contracts_screen.dart';
import 'package:get_paid/src/jobSeekerModule/dashboardSection/screens/jobseeker_dashboard_screen.dart';
import 'package:get_paid/src/jobSeekerModule/myProfileSecction/screens/account_screen.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/screens/proposals_screen.dart';

class JobSeekerBottomNavProvider extends ChangeNotifier {
  Widget currentScreen = const JobSeekerDashBoardScreen();
  int currentIndex = 0;

  updateScreen(int index) {
    updateCurrentScreen(index);
  }

  updateCurrentScreen(int index) {
    switch (index) {
      case 0:
        currentIndex = index;
        currentScreen = const JobSeekerDashBoardScreen();
        notifyListeners();
        break;
      case 1:
        currentIndex = index;
        currentScreen = const JobSeekerChatListScreen();
        notifyListeners();
        break;
      case 2:
        currentIndex = index;
        currentScreen = const JobSeekerMainProposalScreen();
        notifyListeners();
        break;
      case 3:
        currentIndex = index;
        currentScreen = const JobSeekerContractsScreen();
        notifyListeners();
        break;
      case 4:
        currentIndex = index;
        currentScreen = const JobSeekerAccountScreen();
        notifyListeners();
        break;
    }
  }
}
