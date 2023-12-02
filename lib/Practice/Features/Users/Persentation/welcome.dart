import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/Practice/Features/Users/Domain/person_model.dart';

class Welcome extends ConsumerWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myName = ref.read(personProvider).name;
    return Container(
        alignment: Alignment.center, child: Text("Welcome $myName"));
  }
}
