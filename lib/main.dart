import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/pages/turing_machine_page.dart';
import 'features/presentation/cubit/table_cubit.dart';
import 'features/presentation/cubit/turing_cubit.dart';
import 'features/presentation/cubit/turing_history_cubit.dart';
import 'injection.dart' as inj;

void main() {
  inj.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => inj.locator<TuringHistoryCubit>()),
          BlocProvider(create: (_) => inj.locator<TableCubit>()),
          BlocProvider(create: (_) => inj.locator<TuringCubit>())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              textTheme: Theme.of(context).textTheme.apply(
                    fontFamily: "gtw",
                    fontSizeDelta: 5,
                    bodyColor: const Color.fromARGB(255, 31, 28, 26),
                  ),
              //шрифты
              colorScheme: const ColorScheme(
                  onSurface: Color.fromARGB(221, 216, 181, 107),
                  surface: Color.fromARGB(221, 241, 165, 0),
                  onBackground: Color.fromARGB(221, 241, 165, 0),
                  background: Color.fromARGB(221, 241, 165, 0),
                  onError: Color.fromARGB(255, 255, 255, 255),
                  error: Colors.red,
                  onSecondary: Color.fromARGB(221, 0, 0, 0),
                  secondary: Color.fromARGB(221, 241, 165, 0),
                  onPrimary: Color.fromARGB(221, 0, 0, 0),
                  primary: Color.fromARGB(221, 241, 165, 0),
                  brightness: Brightness.dark),
              primaryColor: const Color.fromARGB(221, 241, 165, 0),
              canvasColor: const Color.fromARGB(255, 255, 205, 129),

              //Theme.of(context).textTheme.headline6,
              highlightColor: Colors.black,
              textSelectionTheme: const TextSelectionThemeData(
                  cursorColor: Color.fromARGB(255, 0, 0, 0)),
              scaffoldBackgroundColor: const Color.fromARGB(255, 201, 169, 121),
             ),
          home: const TuringMachinePage(),
          initialRoute: '/',
          // routes: {
          //   '/auth': (context) => const AuthPage(),
          // }
        ));
  }
}
