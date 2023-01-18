import 'package:get_it/get_it.dart';

import 'features/presentation/cubit/table_cubit.dart';
import 'features/presentation/cubit/turing_cubit.dart';
import 'features/presentation/cubit/turing_history_cubit.dart';

final locator = GetIt.instance;

void init() {
  //bloc

  final tableCubit = TableCubit();
  final turingHistory = TuringHistoryCubit();
  
  locator.registerFactory(() => turingHistory);
  locator.registerFactory(() => tableCubit);

  locator.registerFactory(() => TuringCubit(tableCubit, turingHistory));
}
