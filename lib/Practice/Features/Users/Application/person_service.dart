import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/Practice/Features/Users/Controller/personListController.dart';
import 'package:riverpod_practice/Practice/Features/Users/Domain/person_model.dart';

//ref wala parameter not needed, inbuild mai hunxa.
//note: NotifierProvider ko first parameter be the class that extends Notifier,
//.new jun class lai ni garna mildaina. only the one that extends Notifer

final personServiceProvider = StateProvider<PersonService>((ref) {
  return PersonService();
});

class PersonService {
  final peronListNotifierProvider =
      NotifierProvider<PeronListController, List<PersonModel>>(
          PeronListController.new //shortcut
          //longcut be like:
          //() {return PeronListNotifier();}
          );

  //home page ko bull provider switch ko lagi
  final stateProvider = StateProvider<bool>((ref) {
    return false;
  });

  static reset(WidgetRef ref) {
    ref.read(personServiceProvider.notifier).state = PersonService();
  }

  final themeProvider = StateProvider<ThemeData>((ref) {
    return ThemeData.light();
  });

  switchTheme(WidgetRef ref) {
    final currentTheme = ref.read(themeProvider);

    ref.read(themeProvider.notifier).state =
        currentTheme.brightness == Brightness.light
            ? ThemeData.dark()
            : ThemeData.light();
  }

  // final themeProvider = NotifierProvider<ThemeData>((ref) {
  //   return ThemeData.dark();
  // });
}
