import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/Practice/Features/Users/Domain/person_model.dart';

//This is how u make StateNotifierProvider, first parameter is StateNotifier, and Second is List of class
// final peronListNotifierProvider =
//     StateNotifierProvider<PersonListNotifier, List<Person>>((ref) {
//   return PersonListNotifier();
// });

// class PersonListNotifier extends StateNotifier<List<Person>> {
//   PersonListNotifier() : super([]);

//   addPerson(Person person) {
//     state = [...state..add(person)];
//     //state = [...state, person];
//   }

//   removePerson(int index) {
//     state = [...state..removeAt(index)];
//   }
// }

//=====================================================================

//why we use Notifier Provider instead of
//mathi super use hunxa jasma await garna mildaina
//where as tala we can use AsyncNotifier and await server bata aune data.
//mathi, hamle ref use garna mildaina, making it difficult to seperate state + logic

//=============================================================================

//NOTIFIER PROVIDER


//Class vandainam, mathi ko provider ko sub class ho!
class PeronListController extends Notifier<List<PersonModel>> {
  @override
  build() {
    //Notifier ma async await use gareko so that, first time app load hunxa, wait garxa, and we can fetch data from server.
    Future.delayed(const Duration(milliseconds: 200));
    return [];
  }

  addPerson(PersonModel person) {
    state = [...state..add(person)];
    //just to show, how we can use ref(Controls state) that seperates state and logic from UI complete.
    //ref.read(stateProvider.notifier).state = false;
    //state = [...state, person];
  }

  removePerson(int index) {
    state = [...state..removeAt(index)];
  }
}
