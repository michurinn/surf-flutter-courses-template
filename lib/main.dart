import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_courses_template/bloc/colors_pallete_bloc/colors_pallete_bloc.dart';
import 'package:surf_flutter_courses_template/data/colors_repository/colors_repository.dart';
import 'package:surf_flutter_courses_template/screens/pallete_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (context) =>
          ColorsPalleteBloc(colorsRepository: ColorsRepositoryCurrent())..add(ColorsPalleteEventLoad()),
      child: const PalleteScreen(),
    ));
  }
}
