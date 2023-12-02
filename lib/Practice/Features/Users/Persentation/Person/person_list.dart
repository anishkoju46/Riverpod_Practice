import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/Practice/Features/Users/Application/person_service.dart';
import 'package:riverpod_practice/Practice/Features/Users/Domain/person_model.dart';
import 'package:riverpod_practice/Practice/Features/Users/Persentation/Person/person_Info.dart';

// final personListProvider = StateProvider<List<Person>>((ref) {
//   return [Person("Ram", "KTM")];
// });

class PersonList extends ConsumerWidget {
  const PersonList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personService = ref.watch(personServiceProvider);
    final value = ref.watch(personService.peronListNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            //scrollDirection: Axis.horizontal,
            itemCount: value.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return MyPersonInfo(
                person: value[index],
                index: index,
              );
            },
          ),
        ),
        ElevatedButton(
            onPressed: () {
              // ref.read(personListProvider.notifier).state = [...value, Person("Try", "skdf")];

              // ref
              //     .read(personListProvider.notifier)
              //     .update((state) => [...state..add(Person("AAA", "BBB"))]);

              ref
                  .read(personService.peronListNotifierProvider.notifier)
                  .addPerson(PersonModel("Acer", "UK"));

              // int a = 1;
              // print(a
              //   ..isEven
              //   ..isOdd);
            },
            child: const Text("Add Person"))
      ],
    );
  }
}
