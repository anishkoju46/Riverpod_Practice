import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/Practice/Features/Users/Application/person_service.dart';
import 'package:riverpod_practice/Practice/Features/Users/Persentation/Person/person_list.dart';
import 'package:riverpod_practice/Practice/Features/Users/Persentation/welcome.dart';

class FrontPage extends ConsumerWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personService = ref.watch(personServiceProvider);
    final value = ref.watch(personService.stateProvider);
    // final value1 = ref.watch(stateProvider);
    // final value2 = ref.watch(stateProvider);
    // final value3 = ref.watch(stateProvider);
    // final value4 = ref.watch(stateProvider);
    //print("rebuild");
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              //AppReset gardinxa. Class ko naya instance banaidiyesi
              ref.read(personServiceProvider.notifier).state = PersonService();
            },
            icon: const Icon(Icons.restart_alt)),
        IconButton(
            onPressed: () {
              ref.read(personService.themeProvider.notifier).switchTheme();
            },
            icon: const Icon(Icons.sunny))
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          value ? const Expanded(child: PersonList()) : const Welcome(),
          Switch(
            value: value,
            onChanged: (newValue) {
              ref.read(personService.stateProvider.notifier).state = newValue;
            },
          ),
          // Switch(
          //   value: value,
          //   onChanged: (newValue) {
          //     ref.read(stateProvider.notifier).state = newValue;
          //   },
          // ),
          // Consumer(
          //   builder: (context, ref, child) {
          //     print("ComusmerRebuild1");
          //     return Text(ref.watch(stateProvider).toString());
          //   },
          // ),
          // Consumer(
          //   builder: (context, ref, child) {
          //     print("ComusmerRebuild2");
          //     return Text(ref.watch(stateProvider).toString());
          //   },
          // )
        ],
      ),
    );
  }
}
