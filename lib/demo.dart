import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final numberProvider = StateProvider<int>((ref) {
  return 0;
  //return Myclass("RiverPod", 2);
});

final myProvider = StateProvider<Myclass>((ref) {
  return Myclass("Science", 11);
});

class Myclass {
  int level;
  String name;
  Myclass(this.name, this.level);
}

class RiverpodDemo extends ConsumerWidget {
  const RiverpodDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final value = ref.watch(numberProvider);

    //We have a whole new class so object is changed,tesaile StateProvider noties.
    //ref.read(Provider.notifier).state = Myclass("English", 23);

    //ref.read(Provider.notifier).state.name ="asdf"; //only changes member of a class I.E: StateProvider doesnt notifies
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: const Text(
          "RIVERPOD",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 10),
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier).state++;
                    //read acts as down setter and getter. in thi case its setter.
                  },
                  child: const Text("ADD")),
              ElevatedButton(
                  onPressed: () {
                    if (ref.watch(numberProvider) > 0) {
                      ref.read(numberProvider.notifier).state--;
                    }
                  },
                  child: const Text("SUBTRACT")),
              Consumer(builder: (context, ref, child) {
                return Text(
                  ref.watch(numberProvider).toString(),
                  //watch acts as a listener, if any changes is detected, it rebuilds the Conumer le wrap gareko widget
                );
              }),
              Consumer(builder: (context, ref, child) {
                return Text(
                  ref.watch(myProvider).level.toString(),
                );
              })
            ]),
      ),
    );
  }
}

class TextWidget extends ConsumerWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      ref.watch(numberProvider).toString(),
    );
  }
}
