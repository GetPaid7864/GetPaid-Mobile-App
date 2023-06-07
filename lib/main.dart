import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/providers/authProvider.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/create_account_screen.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/fogot_password_screen.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/sign_in_screen.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/splash_screen.dart';
import 'package:get_paid/src/jobSeekerModule/authenticatonSection/screens/update_password_screen.dart';
import 'package:get_paid/src/recruiterModule/AuthSection/providers/recruiter_auth_provider.dart';
import 'package:get_paid/src/recruiterModule/bottomNavBarSection/providers/bottom_navbar_provider.dart';
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
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        ChangeNotifierProvider(create: (context) => RecruiterAuthProvider()),
        ChangeNotifierProvider(create: (context) => RecruiterJobsProvider()),
        ChangeNotifierProvider(create: (context) => RecruiterProfileProvider()),
        ChangeNotifierProvider(
            create: (context) => RecruiterProposalProvider()),
        ChangeNotifierProvider(
            create: (context) => RecruiterDashBoardProviders()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Get Paid',
          navigatorKey: navstate,
          theme: AppTheme.themeData,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            SignInScreen.routeName: (context) => const SignInScreen(),
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            ForgotPasswordScreen.routeName: (context) =>
                const ForgotPasswordScreen(),
            UpdatePasswordScreen.routeName: (context) =>
                const UpdatePasswordScreen(),
          },
          home: const SplashScreen()),
    );
  }
}
