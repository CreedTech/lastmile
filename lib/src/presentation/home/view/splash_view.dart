import 'package:flutter/material.dart';
import 'package:lastmile/src/core/core.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 5000),
      () => Navigator.of(context).pushNamedAndRemoveUntil(
        onboardingOne,
        (route) => false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorWhite,

        // child: SplashScreenContent(),
        child: const SplashScreenContent(),
        // ),
      ),
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
