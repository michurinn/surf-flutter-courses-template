import 'package:surf_flutter_courses_template/domain/app_theme.dart';
// Репозиторий для хранения возможных тем приложения
class ThemesRepository {
  List<AppTheme> get themes => [
        SystemTheme(),
        LightGreenTheme(),
        LightBlueTheme(),
        LightOrangeTheme(),
        DarkGreenTheme(),
        DarkBlueTheme(),
        DarkOrangeTheme()
      ];
}
