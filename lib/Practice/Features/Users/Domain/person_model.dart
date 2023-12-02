//Normal Provider
import 'package:hooks_riverpod/hooks_riverpod.dart';

final personProvider = Provider<PersonModel>((ref) {
  return PersonModel("Ram", "UK");
});

class PersonModel {
  String name;
  String address;
  final ageProvider = StateProvider<int>((ref) {
    return 0;
  });
  PersonModel(this.name, this.address);
}
