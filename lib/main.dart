import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/Practice/Features/Users/Application/person_service.dart';
import 'package:riverpod_practice/Practice/Features/Users/Persentation/Person/person_home.dart';
import 'package:riverpod_practice/Practice/Features/Weather/Presentation/weather_home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personService = ref.watch(personServiceProvider);
    final theme = ref.watch(personService.themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WeatherHome(),
      //home: const FrontPage(),
      theme: theme,
    );
  }
}
