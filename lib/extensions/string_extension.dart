extension EtString on String?{

  String orEmpty() => this??"";

}

extension EtInteger on int?{

  int orZero() => this??0;
}