/*
________________________1    2   3    4   _5__6___7__8___9_______________________________реальный массив____________________________________________________________
 0 |  0 |  0 |  0 |  0 |  0 |  1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |  9 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |                                                                                    
--------------------------------------------------------^^-----------------------------
                                    8    7    6    5     4   3    2    1   0    -1  -2
                                                                                   ||
                                                первый ненулевой  элемент справа (индекс = 0)
*/

import 'package:flutter/animation.dart';

class InfinitList {
  late int position;
  int lastNN = 0;
  int firstNN = 0;

  late String nullElement;
  List<String> list = [];
  InfinitList(List<String> init, this.nullElement) {
    position = init.length;
  }
  String current() {
    return list[position];
  }

  int lastNotNull() {
    for (int i = list.length - 1; i > 0; i--) {
      if (list[i] != nullElement) return i + firstNN;
    }
    return -1;
  }

  int firstNotNull() {
    for (int i = 0; i < list.length; i++) {
      if (list[i] != nullElement) return i + firstNN;
    }
    return -1;
  }

  String operator [](int index) {
    if ((-firstNN + index) < 0 || (-firstNN + index) > list.length - 1) {
      return nullElement;
    }
    return list[-firstNN + index];
  }

  void operator []=(int index, String value) {
    if (lastNN == 0 || firstNN == 0) {
      firstNN = lastNN = index;
      list.add(value);
      return;
    }
    if (index < firstNN) {
      for (int i = 0; i < index - firstNN; i++) {
        list.insert(0, nullElement);
      }
      list[0] = (value);
      firstNN = index;
      return;
    }
    if (index > lastNN) {
      for (int i = 0; i < index - lastNN; i++) {
        list.add(nullElement);
      }
      list[index - firstNN] = value;
      lastNN = index;
      return;
    }
    list[index - firstNN] = value;

    return;
  }
}
