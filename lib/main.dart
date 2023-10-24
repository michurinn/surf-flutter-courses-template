import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'package:surf_flutter_courses_template/bloc/colors_pallete_bloc/colors_pallete_bloc.dart';
import 'package:surf_flutter_courses_template/data/colors_repository/colors_repository.dart';
import 'package:surf_flutter_courses_template/interactors/clipboard_write_interactor.dart';
import 'package:surf_flutter_courses_template/screens/pallete_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          snackBarTheme: SnackBarThemeData(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            width: 200,
            behavior: SnackBarBehavior.floating,
            insetPadding: const EdgeInsets.all(20),
            backgroundColor: Colors.black.withOpacity(0.5),
          ),
        ),
        home: BlocProvider(
          // Загружает цвета палитры для отображения
          create: (context) => ColorsPalleteBloc(
            colorsRepository: ColorsRepositoryCurrent(),
          )..add(
              ColorsPalleteEventLoad(),
            ),
          child: Provider(
            // Для сохранения в буфер обмена
            create: (context) => ClipboardWriteInteractor(
                clipboardWriter: ClipboardWriter.instance),
            child: const PalleteScreen(),
          ),
        ));
  }
}
