import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/data/data_source/themes_data_source.dart';
import 'package:surf_flutter_courses_template/data/themes_repository/themes_repository.dart';
import 'package:surf_flutter_courses_template/data/data_source/local_storage/shared_preferences_local_storage.dart';
import 'package:surf_flutter_courses_template/data/data_source/local_storage/themes_storage.dart';
import 'package:surf_flutter_courses_template/presentation/screens/profile_screen.dart';
import 'package:surf_flutter_courses_template/core/theme_interactor/theme_interactor.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeInteractor>(
      create: (BuildContext context) => ThemeInteractor(
        themesRepository: ThemesRepository(
          themesStorage: ThemesStorage(
            SharedPreferencesLocalStrorage(),
          ),
          themesDataSource: ThemesDataSource(),
        ),
      )..loadTheme(),
      builder: (context, child) {
        final currentTheme = context.watch<ThemeInteractor>().currentTheme;
        return MaterialApp(
          theme: currentTheme.themeData,
          home: const ProfileScreen(),
        );
      },
    );
  }
}
