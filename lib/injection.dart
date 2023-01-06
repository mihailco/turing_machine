import 'package:get_it/get_it.dart';


import 'features/domain/entities/infinit_list_model.dart';
import 'features/domain/entities/table_model.dart';
import 'features/presentation/constants.dart';
import 'features/presentation/cubit/table_cubit.dart';
import 'features/presentation/cubit/turing_cubit.dart';

final locator = GetIt.instance;

void init() {
  //bloc

  List<String> states = ["", "q1"];
  List<String> A = ["", nullElement];
  final Map<Pair, CellCommand> table = {
    const Pair("q1", nullElement): CellCommand(states[0], A[0], "")
  };
  List<String> tmp = [];
  InfinitList list = InfinitList(tmp, nullElement);

  locator.registerFactory(() => TableCubit(states, A, table));
  locator.registerFactory(() => TuringCubit(states, A, table, list));

  // //usecase
  // locator.registerLazySingleton(() => SignInWithUsename(locator()));
  // locator.registerLazySingleton(() => SignUpWithUsername(locator()));

  // //repository
  // locator.registerLazySingleton<UserRepository>(
  //   () => UserRepositoryImpl(locator()),
  // );

  // //data source
  // locator.registerLazySingleton<MyApi>(() => MyApiImpl(locator()));
  // locator.registerLazySingleton<MyWs>(() => MyWsImpl(locator()));

  // //external
  // locator.registerLazySingleton(() => http.Client());
}
