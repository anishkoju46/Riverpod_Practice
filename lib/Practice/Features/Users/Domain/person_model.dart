//Normal Provider
import 'package:hooks_riverpod/hooks_riverpod.dart';

final personProvider = Provider<PersonModel>((ref) {
  return const PersonModel("Ram", "UK", 4);
});

class PersonModel {
  final String name;
  final String address;
  // final ageProvider = StateProvider<int>((ref) {
  //   return 0;
  // });
  final int age;
  const PersonModel(this.name, this.address, this.age);

  PersonModel copyWith({String? name, String? address, int? age}) =>
      PersonModel(name ?? this.name, address ?? this.address, age ?? this.age);
}
