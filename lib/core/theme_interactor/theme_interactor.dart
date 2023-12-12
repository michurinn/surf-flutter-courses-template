import 'package:flutter/foundation.dart';
import 'package:surf_flutter_courses_template/data/themes_repository/themes_repository.dart';
import 'package:surf_flutter_courses_template/domain/app_theme.dart';
import 'package:surf_flutter_courses_template/core/local_storage/themes_storage.dart';

// Интепактор для сохранения и получения сохранённой темы
class ThemeInteractor with ChangeNotifier {
  final ThemesStorage storage;
  final ThemesRepository themesRepository;
  ThemeInteractor({required this.storage, required this.themesRepository});

  AppTheme? _currentTheme;

  // Сохраняет полученную тему как выбранную
  bool _saveTheme(AppTheme theme) {
    try {
      storage.setTheme(theme.name);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  /// Обновляет текущую тему и сохраняет её в локальное хранилище
  bool updateTheme(AppTheme theme) {
    try {
      _saveTheme(theme);
      _currentTheme = theme;
      notifyListeners();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  AppTheme? get currentTheme {
    return _currentTheme;
  }

  // Читает из хранилища сохранённую тему
  void loadTheme() async {
    try {
      final List<AppTheme> themes = themesRepository.themes;
      final String? result = await storage.getTheme;
      // Если тема не сохранена в хранилище, установим SystemTheme
      if (result == null) {
        _currentTheme = SystemTheme();
        notifyListeners();
        return;
      }
      // Если имя темы, сохранённой в хранилище, не соответсвует какой-либо теме из репозитория, установим SystemTheme
      final theme = themes.firstWhere(
        (element) => element.name == result,
        orElse: () => SystemTheme(),
      );
      _currentTheme = theme;
      notifyListeners();
    } catch (_) {
      // При возникновении ошибки установим SystemTheme
      _currentTheme = SystemTheme();
      notifyListeners();
    }
  }
}
