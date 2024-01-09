import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/api/global_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // late StreamSubscription<InternetConnectionStatus> _connectivitySubscription;
  // bool isInternetConnected = true;
  late bool hasSeenOnboarding = false;

  @override
  void initState() {
    redirectToAppropriateScreen();
    loadHasSeenOnboarding();
    // Future.delayed(
    //   const Duration(milliseconds: 5000),
    //   () => Navigator.of(context).pushNamedAndRemoveUntil(
    //     onboarding,
    //     (route) => false,
    //   ),
    // );
    super.initState();
  }

  @override
  void dispose() {
    // _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> loadHasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    });

    print("====================");
    print("Checking for new users(splash screen).....");
    print(prefs.get('hasSeenOnboarding'));
    print("====================");
  }

  // Future<void> setHasSeenOnboardingPreference(bool value) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('hasSeenOnboarding', value);
  //   setState(() {
  //     hasSeenOnboarding = value;
  //   });
  // }

  // void checkConnectivity() async {
  //   final hasConnection = await InternetConnectionChecker().hasConnection;
  //   setState(() {
  //     isInternetConnected = hasConnection;
  //   });

  //   if (isInternetConnected) {
  //     redirectToAppropriateScreen();
  //   } else {
  //     showNoInternetScreen();
  //   }

  //   _connectivitySubscription = InternetConnectionChecker()
  //       .onStatusChange
  //       .listen((InternetConnectionStatus status) {
  //     if (status == InternetConnectionStatus.connected) {
  //       redirectToAppropriateScreen();
  //     } else {
  //       showNoInternetScreen();
  //     }
  //   });
  // }

  Future<bool> hasAuthToken() async {
    String token = await GlobalService.sharedPreferencesManager.getAuthToken();
    return token.isNotEmpty;
  }

  Future<void> redirectToAppropriateScreen() async {
    bool userHasToken = await hasAuthToken();
    await Future.delayed(const Duration(seconds: 5));
    // bool isNewUser = true;

    if (hasSeenOnboarding) {
      if (userHasToken) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          home,
          (route) => false,
        );
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          login,
          (route) => false,
        );
      }
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
        onboarding,
        (route) => false,
      );
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => OnboardingScreen()));
    }
  }

  // void showNoInternetScreen() {
  //   setState(() {
  //     isInternetConnected = false;
  //   });
  // }

  // void onTryAgain() {
  //   checkConnectivity();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorWhite,

        child: SplashScreenContent(),
        // child: isInternetConnected
        //     ? const SplashScreenContent()
        //     // WelcomeBackScreen()
        //     : No_internetScreen(onTap: onTryAgain),
      ),
      // ),
    );
  }
}

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({super.key});

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  fit: BoxFit.fill,
                  'assets/images/logo.png',
                  // height: 100,
                ),
                // SizedBox(
                //   height: 15,
                // ),
                // Text(
                //   'TAA CONNECT',
                //   style: GoogleFonts.nunito(
                //     color: colorsBlack,
                //     fontSize: 30,
                //     fontWeight: FontWeight.w800,
                //     letterSpacing: 0.3,
                //   ),
                // )
              ],
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 25),
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child: Text(
        //       'Version 1.0.0',
        //       style: GoogleFonts.nunito(
        //         color: colorsBlack,
        //         fontSize: 23,
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
