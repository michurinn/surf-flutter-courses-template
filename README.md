# Description of your result

1.  Создана модель данных AppTheme, которая содержит свойства 'имя темы' (для сохранения в SharedPreferences) и 
'themeData' (объект класса ThemeData, описывающий текущую тему).
Каждая тема также наследуется от классов (DarkTheme, LightTheme, DefaultTheme). Впоследствии это используется для группировки тем 
в BottomSheet для выбора тем.
2. Создан репозиторий ThemesRepository, содержащий все доступные для приложения темы.
3. Создан интерфейс класса для использования локального хранилища LocalStorage, также реализация этого интерфейса 
SharedPreferencesLocalStrorage для работы с локальным хранилищем с помощью пакета SharedPreferences,
а также класс ThemesStorage, принимающий данный интерфейс и работающий с ним по установленному ключу _themeKey.
4. Создан интерактор ThemeInteractor, объединённый с миксином ChangeNotifier (для последующего использования в ChangeNotifierProvider),
осуществляющий загрузку темы при инициализации, сохранение в локальное хранилище выбранной темы, 
применение темы к приложению ( с помощью метода notifyListeners ), а также предоставляет доступные темы из репозитория ThemesRepository.
5. Созданы класссы AppColors, AppTypography , описывающие цвета и текстовые стили приложения соответсвенно.
6. Созданы расширения для тем ThemeButtonStyles, ThemeColors, ThemeTextStyles, для объектов темы, вид которых предполагается
отличным от описанных в ThemeData.
7. Созданы расширения для BuildContext для более удобного доступа к расширениям.
8. Созданы экраны ProfileScreen и ThemesBottomsheet.

## Problems

1. Правильно ли я понимаю, что textTheme в теме принимает объект TextTheme, который содержит описания стилей текста,
но самостоятельно они не применяются к объектам, но их можно использовать обращаясь к текущему ThemeData?
В таком случае нет необходимости определять TextStyles в AppTypography, а использовать описанный выше способ?
2. Не понимаю, как сделать изменение темы с помощью метода линейной интерполяции. 
3. Мне кажется здесь моё использование sealed classes не нужно ).
4. При данной реализации происходит следующая последовательность state Profile Screen:
    Сначала применяется тема null;
    затем после события loadTheme() применяется сохранённая тема
    Можно ли сделать так, чтобы builder в ChangeNotifierProveider срабатывал только после события loadTheme()?
    Или как иначе решить данную проблему? 
## More

[Here you can brag about what you managed to implement or do something beyond the task]

## Demo

[Leave links to screencasts/screenshots here, you can use a GitHub repository or a separate cloud service]
