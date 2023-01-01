import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:statrco/features/domain/entities/table_model.dart';

void main() {
  late List<String> A = [];
  late List<String> states = [];
  late Map<Pair, CellCommand> table = {};

  setUp(() {});

  test(
    'should throw a server exception when the response code is 404 or other',
    () {
      table[Pair("q1", "a1")] = CellCommand("q2", "a2", "L");
      table[Pair("q2", "a2")] = CellCommand("q3", "a3", "L");
      table[Pair("q3", "a3")] = CellCommand("q4", "a4", "L");
      var t = (table[Pair("q1", "a1")]);
      var t2= (table[Pair("q3", "a3")]);
      print(t);
    },
  );
}
