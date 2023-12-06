import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/Practice/Features/Users/Application/person_service.dart';
import 'package:riverpod_practice/Practice/Features/Users/Domain/person_model.dart';

class MyPersonInfo extends ConsumerWidget {
  const MyPersonInfo({super.key, this.person, this.index});
  final PersonModel? person;
  final int? index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("$index build");
    final personService = ref.read(personServiceProvider);
    //final myPerson = person ?? ref.read(personProvider);
    return Consumer(builder: (context, ref, child) {
      final myPerson = person ??
          ref.read(
            personService.peronListNotifierProvider.select(
                (value) => value.length > index! ? value[index!] : null),
          );
      return Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              //color: const Color(0xffC3C4BE),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final name = ref.watch(personService
                        .peronListNotifierProvider
                        .select((value) =>
                            value.length > index! ? value[index!].name : null));
                    print("$index gesture person Name");
                    return GestureDetector(
                        onTap: () {
                          ref
                              .read(personService
                                  .peronListNotifierProvider.notifier)
                              .updatePerson(index!, name: "updated");
                        },
                        child: Text("NAME: $name"));
                  },
                ),
                Text("ADDRESS: ${myPerson!.address}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          // if (intValue > 0) {

                          //   //ref.read(myPerson.ageProvider.notifier).state--;
                          //   // if (ref.read(myPerson.ageProvider) <= 0) {
                          //   //   ref
                          //   //       .read(personService.stateProvider.notifier)
                          //   //       .state = false;
                          //   // }
                          // } else {
                          //   ref
                          //       .read(personService.stateProvider.notifier)
                          //       .state = false;
                          // }
                          ref
                              .read(personService
                                  .peronListNotifierProvider.notifier)
                              .subtractAge(index!);
                        },
                        child: const Icon(Icons.remove)),
                    Consumer(builder: (context, ref, child) {
                      print("Age wala");
                      final ageValue = ref.watch(personService
                          .peronListNotifierProvider
                          .select((value) => value.length > index!
                              ? value[index!].age
                              : null));
                      return Text("Age: $ageValue");
                    }),
                    //Text(ref.watch(ref.read(personProvider).ageProvider).toString()),
                    InkWell(
                        onTap: () {
                          ref
                              .read(personService
                                  .peronListNotifierProvider.notifier)
                              .addAge(index!);
                          //ref.read(myPerson.ageProvider.notifier).state++;
                        },
                        child: const Icon(Icons.add)),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    if (index != null) {
                      // ref
                      //     .watch(personListProvider.notifier)
                      //     .update((state) => [...state])
                      //     .removeAt(index!);

                      // final personList =
                      //     ref.read(personListProvider.notifier).state;

                      // ref.read(personListProvider.notifier).state = [
                      //   ...personList..removeAt(index!)
                      // ];

                      //Using State Notifier Provider: Business logic and state is seperated form UI
                      ref
                          .read(
                              personService.peronListNotifierProvider.notifier)
                          .removePerson(index!);
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
