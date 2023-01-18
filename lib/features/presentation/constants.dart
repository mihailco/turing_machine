import 'package:flutter/cupertino.dart';

const String nullElement = "λ";

///cell width in listView 
const double listCellWidth = 77;

///cell width in listView with margin
const double cellWidth = (listCellWidth+4 );

///the width of the display, yes it is not a constant
double displayWidth(context) {
  return MediaQuery.of(context).size.width;
}
