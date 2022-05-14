import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
//   static final darkTheme = ThemeData.dark().copyWith(
//     scaffoldBackgroundColor: const Color.fromARGB(255, 62, 61, 61),
//     fontFamily: 'AkayaTelivigala',
// // colorScheme: const ColorScheme.dark().copyWith(primary: Colors.red),
//   );

  static final lightTheme = ThemeData(
    // primarySwatch: Colors.red,
    // primaryColor: Colors.red,
    fontFamily: 'AkayaTelivigala',
    // scaffoldBackgroundColor: Colors.teal.shade50,
    colorScheme: const ColorScheme.light(),
  );
  static final darkTheme = ThemeData(
    // primaryColor: Colors.black,
    fontFamily: 'AkayaTelivigala',
    scaffoldBackgroundColor: Color.fromARGB(227, 56, 53, 53),
    colorScheme: const ColorScheme.dark(),
  );
}
