({List<String> myList, int id, Map<int, String> myMap}) myRecord =
    (myList: [], id: 1, myMap: {2: "ss"});

Map<int, ({List<String> myList, int id, Map<int, String> myMap})> secondMap = {
  3: myRecord
};

final List<String> aList = [];

void main() {
  aList.add("value");
  aList.clear();
  aList.addAll(["second value"]);
}

//mathi ko record = return type
//() ma req postitional = int
//named parameter = mathi ko record
//return = mathi ko id ko value = tala ko positional wala int

({List<String> myList, int id, Map<int, String> myMap}) aMethod(int id,
    {required ({
      List<String> myList,
      int id,
      Map<int, String> myMap
    }) myRecord}) {
  return (myList: myRecord.myList, id: id, myMap: myRecord.myMap);
}

//return type = map
//argument ma ni same
//named para meter
//tyo parameter ma vako is ?
// =>  used to if null empty map else: existing map

Map<int, String> theFunction({Map<int, String>? theMap}) => theMap ?? {};

void arkoFunction([int? sN]) {
  sN = 12;
  print(sN);
}

void modules() {
  int a = 1;
  int b = 2;
  int c = a % b;
  dynamic variable;
  print(c);

  if (variable is! int) {
    print("is int");
  }

  //  (True expre) ?? (false)
}

String? word;
int? wordCount = (word?.length);

void listFunction() {
  List<String> hamroList = [];
  hamroList
    ..add("sdfsdf")
    ..removeAt(1)
    ..clear()
    ..addAll([]);

  List<String> ourList = [];

  ourList = [...hamroList..add("hhg"), "sdf", "sss", "gggg"];
}

class Myclass {
  final int courseID;
  final String courseName;
  final String desc;

  const Myclass(
      {required this.courseID, required this.courseName, required this.desc});

  // Myclass.namedConstructor({required this.courseID, required this.courseName});

  //Animal : height color
  //rabit: sdf
  //dog: dskf
}
