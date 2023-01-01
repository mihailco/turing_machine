// import 'package:equatable/equatable.dart';

// import 'infinit_list_model.dart';
// import 'table_model.dart';

// /*
// __a\q_|_q0_|______________q1____________|________________q2___________|
// __a0__|__*__|__nextState&nextA&move__|__nextstate&nexta&move__|
// __a1__|__*__|__nextstate&nexta&move__|__nextstate&nexta&move__|
// __a2__|__*__|__nextstate&nexta&move__|__nextstate&nexta&move__|
// __a3__|__*__|__nextstate&nexta&move__|__nextstate&nexta&move__|

// машина тьюринга изначально находится в состоянии q1 и
//  расположена в первом ненулевом элементе справа 
// */
// const moveLeft = "L";
// const moveRight = "R";

// class CurrentPosition {
//   final String state;
//   final int index;

//   CurrentPosition(this.state, this.index);
// }

// class TurungMachineModel {
//   final Map<Pair, CellCommand> table;
//   late CurrentPosition currentposition;
//   Set<String> states = {};
//   Set<String> A = {};
//   late InfinitList list;

//   TurungMachineModel(this.table, List<String> lenta, CurrentPosition pos) {
//     table.forEach((key, value) {
//       states.add(key.state);
//       A.add(key.A);
//     });
//     list = InfinitList(lenta, A.first);
//     currentposition = pos;
//   }

//   void execute(CurrentPosition pos, int counter) {
//     if (pos.state == states.first||counter>500) return;
//     counter++;
//     int index = pos.index;
//     CellCommand? next = table[Pair(pos.state, list[pos.index])];
//     if (next == null) return;
//     list[pos.index] = next.rewrite ?? list[pos.index];

//     if (next.moveTo == moveLeft) {
//       list.moveLeft();
//       index++;
//     }

//     if (next.moveTo == moveRight) {
//       list.moveRight();
//       index--;
//     }
//     CurrentPosition n = CurrentPosition(next.nextState ?? pos.state, index);

//     return execute(pos, counter);
//   }
// }
