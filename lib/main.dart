import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/pages/turing_machine_page.dart';
import 'features/presentation/cubit/table_cubit.dart';
import 'features/presentation/cubit/turing_cubit.dart';
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
          BlocProvider(create: (_) => inj.locator<TableCubit>()),
          BlocProvider(create: (_) => inj.locator<TuringCubit>())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              fontFamily: "Elite",
              //шрифты
              primaryColor: const Color.fromRGBO(150, 123, 85, 1),
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Color.fromARGB(255, 31, 28, 26),
                    // displayColor: Colors.pinkAccent, //<-- SEE HERE
                  ),
              canvasColor: Color.fromARGB(255, 190, 157, 107),

              //Theme.of(context).textTheme.headline6,
              highlightColor: Colors.black,
              textSelectionTheme: const TextSelectionThemeData(
                  cursorColor: Color.fromARGB(255, 1, 175, 166)),
              scaffoldBackgroundColor: Color.fromARGB(255, 201, 169, 121),

              //textfield
              // inputDecorationTheme: InputDecorationTheme(

              //   contentPadding: const EdgeInsets.all(3),
              //   floatingLabelStyle: const TextStyle(
              //       color: Color.fromARGB(255, 0, 153, 145), fontSize: 18),
              //   focusedBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(
              //           color: Color.fromARGB(255, 0, 153, 145), width: 2),
              //       borderRadius: BorderRadius.circular(16)),
              //   enabledBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(
              //           color: Color.fromARGB(162, 0, 138, 131), width: 2),
              //       borderRadius: BorderRadius.circular(8)),
              // ),
              elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Color.fromARGB(255, 0, 153, 145);
                }
                return const Color.fromARGB(162, 0, 138, 131);
              })))),
          home: TuringMachinePage(),
          initialRoute: '/',
          // routes: {
          //   '/auth': (context) => const AuthPage(),
          // }
        ));
  }
}
