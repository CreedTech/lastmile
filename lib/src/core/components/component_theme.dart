import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color colorsBlack = Color(0xFF212327);
const Color colorsBlackGray = Color.fromARGB(255, 27, 27, 27);
const Color colorPrimary = Color(0xFFD40E0E);
const Color colorWhite = Color(0xFFFFFFFF);
const Color colorLightGray = Color(0xFFEFEFEF);
const Color colorGray = Color(0xFF808080);
const Color colorTextGray = Color(0xFF585858);
const Color errorTextColor = Color(0xFFFF0000);
const Color buttonGray = Color(0xFFDEDEDE);
const Color borderGray = Color(0xFFE1E1E1);
const Color textGray = Color(0xFF595959);
const Color darkThemeText = Color.fromARGB(255, 135, 134, 134);
const Color colorInTransit = Color(0xffFFF9E7);
const Color colorInTransitText = Color(0xffFCC60C);

final ligthTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: colorPrimary,
    // primarySwatch: primaryCustomSwatch,
    brightness: Brightness.light,
    fontFamily: GoogleFonts.roboto().fontFamily,
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(),
      bodyMedium: TextStyle(),
    ).apply(
      bodyColor: colorsBlack,
      displayColor: colorsBlack,
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: colorPrimary),
    colorScheme: const ColorScheme.light()
        .copyWith(primary: colorPrimary, onPrimary: colorPrimary)
        .copyWith(
          primary: colorPrimary,
          secondary: colorPrimary,
          brightness: Brightness.light,
        )
        .copyWith(background: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      // hintStyle: Theme.of(context).textTheme.greySubtitle1,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorsBlack,
        ),
      ),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    ),
    );

final darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: colorPrimary,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.white,
  ),
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(),
    bodyMedium: TextStyle(),
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  fontFamily: GoogleFonts.nunito().fontFamily,
  bottomSheetTheme:
      BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
  scaffoldBackgroundColor: colorsBlack,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: colorPrimary),
  colorScheme: const ColorScheme.dark()
      .copyWith(primary: colorPrimary, onPrimary: colorPrimary)
      .copyWith(
        secondary: colorPrimary,
        brightness: Brightness.dark,
      )
      .copyWith(background: colorsBlack),
);
