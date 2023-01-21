import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/cubit/table_cubit.dart';
import '../cubit/turing_cubit.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late double value = context.read<TuringCubit>().duration / 1000;
  late TextEditingController tfStepsController = TextEditingController(
      text: context.read<TuringCubit>().maxSteps.toString());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Пауза между шагами"),
          Slider(
            min: 0.1,
            max: 3.499,
            label: "${value.toStringAsFixed(3)} секунд",
            divisions: 12,
            value: value,
            onChanged: (v) {
              value = v;
              context.read<TuringCubit>().setDuration((v * 1000).toInt());
              setState(() {});
            },
          ),
          Row(
            children: [
              const Text(
                "Количество шагов:  ",
              ),
              Container(
                color: Colors.black12,
                width: 100,
                child: TextField(
                  onSubmitted: (value) {
                    tfStepsController.text =
                        tfStepsController.text.replaceAll(RegExp("[^0-9]"), "");
                    context
                        .read<TuringCubit>()
                        .setMaxSteps(int.parse(tfStepsController.text));
                  },
                  expands: false,
                  controller: tfStepsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration.collapsed(
                    focusColor: Colors.black12,
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 66, 39, 39)),
                    hintText: 'Введите здесь',
                  ),
                ),
              ),
            ],
          ),
          if (Theme.of(context).platform != TargetPlatform.windows)
            const SizedBox()
          else
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  margin: const EdgeInsets.all(15),
                  height: 2,
                ),
                TextButton(
                    onPressed: () async {
                      FilePickerResult? outputFile = await FilePicker.platform
                          .pickFiles(
                              dialogTitle: 'Please select an input file:',
                              type: FileType.custom,
                              allowedExtensions: ['mco']);

                      if (outputFile == null) {
                        return;
                      }
                      final str = File(outputFile.files.single.path!)
                          .readAsStringSync();
                      // ignore: use_build_context_synchronously
                      context.read<TableCubit>().fromJson(jsonDecode(str));
                    },
                    child: const Text("Прочитать таблицу с файла",
                        style: TextStyle(color: Colors.black))),
                TextButton(
                    onPressed: () async {
                      final String fileStr =
                          jsonEncode(context.read<TableCubit>().toJson());
                      String? outputFile = await FilePicker.platform.saveFile(
                          dialogTitle: 'Please select an output file:',
                          type: FileType.custom,
                          allowedExtensions: ['mco']);

                      if (outputFile == null) {
                        return;
                      }
                      File("${outputFile.replaceAll(".mco", "")}.mco").writeAsString(fileStr);
                    },
                    child: const Text(
                      "Записать таблицу в файл",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          Container(
            color: Theme.of(context).primaryColor,
            margin: const EdgeInsets.all(15),
            height: 2,
          ),
          TextButton(
              onPressed: () {
                context.read<TuringCubit>().clear();
              },
              child: const Text(
                "Очистить ленту",
                style: TextStyle(color: Colors.red),
              )),
          TextButton(
              onPressed: () {
                context.read<TuringCubit>().clear();
                context.read<TableCubit>().clear();
              },
              child: const Text(
                "Очистить всё",
                style: TextStyle(color: Colors.red),
              )),
          const SizedBox(
            height: 35,
          )
        ],
      ),
    );
  }
}
