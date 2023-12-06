import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeController extends Notifier<ThemeData> {
  final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
  );
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.grey,
  );
  @override
  ThemeData build() {
    return lightTheme;
  }

  switchTheme() {
    state = isDarkMode ? lightTheme : darkTheme;
  }

  bool get isDarkMode => state.brightness == Brightness.dark;
}
