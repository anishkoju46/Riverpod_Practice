class YOYO {
  final int id;
  final String jpt;

  //Default either with {} or without
  const YOYO({required this.id, required this.jpt});

  //Named ma chai Class ko name  paxi . (desired named)
  factory YOYO.empty() => const YOYO(id: 0, jpt: " ");

  static YOYO emptyOne() {
    return YOYO.empty();
  }
}

aFuction() {
  final yoyoEmpty = YOYO.empty();
  final yoyoEmptyTwo = YOYO.emptyOne();
}


//named constructor le alternative rup ma tei class ko instance diyo
//static = With in a class matra use hunxa / 
