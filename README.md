# Description of your result

You can describe your results in any language that is convenient for you, not just English.

## Description

Используемый порядок решения задачи:
1. Data Object
2. Repository
3. Global State
4. Dependency Injection
5. Routing
6. UI (Common)
7. UI (Widgets)

🟢 Data Object в задаче являются объекты класса ForecastDto, которые содержат строку ответа магического шара
🟢 Repository является MagicBallAnswersRepository, который принимает RestClient и в качестве параметра.
    🔵 RestClient написан с использованием пакета retrofit, по примеру из pub.dev. Json, получаемый от сервера, 
    декодируется в ForecastDto, для определения которого использовался пакет JsonSerializable.
    🔵 Индикация 'потряхивания' телефона осуществляется с помощью пакета shake, реализация используемого для данных целей класса
    происходит при создании MagicBallCubit.
🟢 GlobalState реализован с помощью Cubit, стейты которого описаны в [lib/bloc/magic_ball_bloc/magic_ball_state.dart].
🟢 Routing не требует настройки: приложение состоит из 1 экрана
🟢 UI (Common): MaigicBallScreen использует BlocListener<MagicBallCubit, MagicBallState> для управления анимациями и смены текста в шаре.
    BlocBuilder<MagicBallCubit, MagicBallState> необходим  только только для перерисовки текста внутри шара.
4. 
## How to

## Problems

🟠 BlocBuilder<MagicBallCubit, MagicBallState> должен быть непосредственно над виджетом, который он перерисовывает, а не над всем поддеревом.

## More

[Here you can brag about what you managed to implement or do something beyond the task]

## Demo

[Leave links to screencasts/screenshots here, you can use a GitHub repository or a separate cloud service]
