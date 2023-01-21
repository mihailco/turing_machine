import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/widgets/scroll_beh.dart';

import '../cubit/turing_history_cubit.dart';
import '../cubit/turing_history_state.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TuringHistoryCubit, HistoryTuringState>(
      builder: (context, state) {
        return ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: DraggableScrollableSheet(
              maxChildSize: 0.8,
              initialChildSize: 0.8,
              // snap: true,
              expand: false,
              builder: (_, contr) {
                return ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: RichText(
                          text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: const <InlineSpan>[
                          TextSpan(
                              text: "Как пользоваться\n\n",
                              style: TextStyle(fontSize: 33)),
                          TextSpan(
                              text: '1.',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' Настройте таблицу\n'),
                          TextSpan(
                              text: '   1.1',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  ' добавьте необходимое количество состояний'),
                          TextSpan(
                              text: " (+1 справа от таблицы)\n",
                              style: TextStyle(color: Colors.black38)),
                          TextSpan(
                              text: '   1.2',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  ' добавьте необходимое количество слов во внешний алфавит '),
                          TextSpan(
                              text: "(поле для ввода ниже таблицы)\n",
                              style: TextStyle(color: Colors.black38)),
                          TextSpan(
                              text: '   1.3',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  ' В ячейках таблицы задайте параметры переходов '),
                          TextSpan(
                              text:
                                  "(символ, на который перезапишет, перемещение, следующее состояние)\n",
                              style: TextStyle(color: Colors.black38)),
                          TextSpan(
                              text:
                                  ' (для удаления определённого столбца или строки просто дважды нажмите по названию)\n',
                              style: TextStyle(color: Colors.black38)),
                          TextSpan(
                              text: '4.',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' Введите слово на ленте\n'),
                          TextSpan(
                              text: '5.',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  ' Двойным нажатием по ячейке ленты укажите положение головки машины Тьюринга \n'),
                          TextSpan(
                              text: '6.',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' Нажмите запустить '),
                          TextSpan(
                              text: "(двойной клик для запуска без пауз)",
                              style: TextStyle(color: Colors.black38)),
                        ],
                      )),
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}
