# Description of your result

Решение задачи состояло из следующих шагов:
1. Доступные на данный момент цвета помещены в репозиторий, который предоставляет к ним доступ.
2. Состояния экрана доступных цветов управляется ColorsPalleteBloc, который получает цвета из репозитория и предоставляет список 
цветов для отображения
3. Копирование в буфер обмена осуществляется с помощью ClipboardWriteInteractor, который использует для записи библиотеку super_clipboard
4. При переходе на экран деталей цвета используется анимация Hero 

## Description

## How to

## Problems

1. Функция onTap в lib/screens/pallete_details_screen.dart стр.83 используется чтобы не передавать экземпляр ClipboardWriteInteractor
в _FieldWithShadow, мне кажется я сделал как-то нелогично ))
2. В PalleteScreen доступ к ClipboardWriteInteractor осуществляется через Provider, а в PalleteDetailsScreen передаётся в качестве параметра. Наверное, следует сделать единообразно.
3. Отсутвует ErrorState для ColorsPalleteBloc
4. Пустые цвета должне отфильтровывать Bloc, а не репозиторий
## More

[Here you can brag about what you managed to implement or do something beyond the task]

## Demo

https://disk.yandex.ru/i/6d8rLhPk-hTCVg