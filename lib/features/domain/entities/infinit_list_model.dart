/*                                | used part                                |
________offset_________1    2   3    4   _5__6___7__8___9__________________________________________________________________________
 0 |  0 |  0 |  0 |  0 |  0 |  1 |  1 |  1 |  1 |  1 |  1 |  1 |  1 |  1 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |                                                                                    
--------------------------------------------------------^^-----------------------------
                                    8    7    6    5     4   3    2    1   0    -1  -2
                                                                                   ||
                                                первый ненулевой  элемент справа (индекс = 0)
*/


class InfinitList {
  int lastNN = 0;
  int firstNN = 0;

  late String nullElement;
  List<String> list = [];
  InfinitList(List<String> init, this.nullElement);

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
    //if an index outside the array in use is requested, it returns an empty element
    if ((-firstNN + index) < 0 || (-firstNN + index) > list.length - 1) {
      return nullElement;
    }
    return list[-firstNN + index];
  }

  void operator []=(int index, String value) {
    //if there are 0 elements in the array
    if (lastNN == 0 || firstNN == 0) {
      firstNN = lastNN = index;
      list.add(value);
      return;
    }

    //if the index is less than the first element, adds to the beginning of the array
    if (index < firstNN) {
      for (int i = 0; i <  firstNN- index; i++) {
        list.insert(0, nullElement);
      }
      list[0] = (value);
      firstNN = index;
      return;
    }
      //if the index is less than the first element, adds to the end of the array
    if (index > lastNN) {
      for (int i = 0; i < index - lastNN; i++) {
        list.add(nullElement);
      }
      list[index - firstNN] = value;
      lastNN = index;
      return;
    }

    //if the index points to the used part of the array
    list[index - firstNN] = value;

    return;
  }

  void clear() {
    list.clear();
    lastNN = 0;
    firstNN = 0;
  }
}
