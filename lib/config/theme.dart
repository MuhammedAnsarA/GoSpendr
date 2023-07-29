import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
  );
}



// import 'package:flutter/material.dart';

// ThemeData theme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     fontFamily: "Avenir",
//     textTheme: textTheme(),
//   );
// }

// TextTheme textTheme() {
//   return TextTheme(
//     headline1: TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.bold,
//       fontSize: 36,
//     ),
//     headline2: TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.bold,
//       fontSize: 22,
//     ),
//     headline3: TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.bold,
//       fontSize: 18,
//     ),
//     headline4: TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.bold,
//       fontSize: 16,
//     ),
//     headline5: TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.bold,
//       fontSize: 14,
//     ),
//     headline6: TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.normal,
//       fontSize: 14,
//     ),
//     bodyText1: TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.normal,
//       height: 1.75,
//       fontSize: 12,
//     ),
//     bodyText2: TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.normal,
//       fontSize: 10,
//     ),
//   );
// }