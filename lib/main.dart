import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/providers/authProvider.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/create_account_screen.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/fogot_password_screen.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/splash_screen.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/update_password_screen.dart';
import 'package:get_paid/src/jobSeekerModule/bottomNavBar/providers/jobseeker_bottom_navbar_provider.dart';
import 'package:get_paid/src/jobSeekerModule/bottomNavBar/screens/jobseeker_botttom_navbar.dart';
import 'package:get_paid/src/jobSeekerModule/dashboardSection/providers/jobseeker_dashboard_provider.dart';
import 'package:get_paid/src/jobSeekerModule/myProfileSecction/providers/jobseeker_myprofile_provider.dart';
import 'package:get_paid/src/jobSeekerModule/profileSetupSection/providers/jobseeker_profile_setup_provider.dart';
import 'package:get_paid/src/jobSeekerModule/proposalSection/providers/job_seeker_proposal_provider.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/providers/recruiter_auth_provider.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/screens/fogot_password_screen.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/screens/sign_in_screen.dart';
import 'package:get_paid/src/recruiterModule/bottomNavBarSection/providers/bottom_navbar_provider.dart';
import 'package:get_paid/src/recruiterModule/bottomNavBarSection/screens/bottomNavScreen.dart';
import 'package:get_paid/src/recruiterModule/dashboardSection/providers/recruiter_dashboard_provider.dart';
import 'package:get_paid/src/recruiterModule/jobSection/providers/recruiter_jobs_provider.dart';
import 'package:get_paid/src/recruiterModule/profileSection/providers/recruiter_profile_provider.dart';
import 'package:get_paid/src/recruiterModule/proposalSection/provider/recruiter_proposal_provider.dart';
import 'package:get_paid/utils/theme.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'helpers/navigatorHelper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application. fitness app
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ///Job Seeker Providers
        ChangeNotifierProvider(create: (context) => JobSeekerAuthProvider()),
        ChangeNotifierProvider(
            create: (context) => JobSeekerBottomNavProvider()),
        ChangeNotifierProvider(
            create: (context) => JobSeekerDashBoardProvider()),
        ChangeNotifierProvider(
            create: (context) => JobSeekerMyProfileProvider()),
        ChangeNotifierProvider(
            create: (context) => JobSeekerProfileSetupProvider()),

        ///Recruiter Providers
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        ChangeNotifierProvider(create: (context) => RecruiterAuthProvider()),
        ChangeNotifierProvider(create: (context) => RecruiterJobsProvider()),
        ChangeNotifierProvider(create: (context) => RecruiterProfileProvider()),
        ChangeNotifierProvider(
            create: (context) => RecruiterProposalProvider()),
        ChangeNotifierProvider(
            create: (context) => RecruiterDashBoardProviders()),
        ChangeNotifierProvider(
            create: (context) => JobSeekerProposalProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Get Paid',
          navigatorKey: navstate,
          theme: AppTheme.themeData,
          routes: {
            ///Recruiter Routes
            SplashScreen.routeName: (context) => const SplashScreen(),
            RecruiterSignInScreen.routeName: (context) =>
                const RecruiterSignInScreen(),
            JobSeekerSignUpScreen.routeName: (context) =>
                const JobSeekerSignUpScreen(),
            RecruiterForgotPasswordScreen.routeName: (context) =>
                const RecruiterForgotPasswordScreen(),
            UpdatePasswordScreen.routeName: (context) =>
                const UpdatePasswordScreen(),
            BottomNavScreen.routeName: (context) => const BottomNavScreen(),

            ///JobSeeker routes
            JobSeekerForgotPasswordScreen.routeName: (context) =>
                const JobSeekerForgotPasswordScreen(),
            JobSeekerBottomNavScreen.routeName: (context) =>
                const JobSeekerBottomNavScreen(),
            JobSeekerBottomNavScreen.routeName: (context) =>
                const JobSeekerBottomNavScreen(),
          },
          home: const SplashScreen()),
    );
  }
}
