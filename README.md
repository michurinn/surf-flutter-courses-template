# Description of your result

Задание — GestureMaster
Предлагаем вам реализовать "слишком" интерактивный виджет!

Например, это может быть обычный квадрат, но если для вас он слишком скучный, можете использовать любое фото или иконку.

Растяните виджет `Stack` по всему экрану и оберните ваш виджет в `Positioned`. Он позволяет зафиксировать расположение виджета на экране. Пусть его начальная позиция будет центре экрана
За ним в `Stack` поместите `GestureDetector` обернутый в `Positioned.fill`, чтобы он занял весь `Stack`.
Найдите подходящие callback'и, которые можно передать в параметры `GestureDetector`, чтобы в них передавались данные, которые помогут вам реализовать некоторые трансформации.
А именно:

изменение положение вашего виджета на drag;
изменение формы или цвета на tap;
вращение виджета на long press.
Добавлять фильтр жестов, чтобы они происходили непосредственно с вашим виджетом — не обязательно. Пусть жест в любом месте экрана может повлиять на положение/форму/цвет/вращение вашего виджета.

Для реализации вам придется освежить знания из предыдущих тем про виджеты.

Также вам могут помочь виджеты AnimatedContainer и RotationTransition.


## Description

1. Stack находится в корне поддерева виджетов, возвращаемого методом build в _LogoWidgetState, поетому он автоматически занимает всё пространство родителя ( в нашем случае екрана).
2. Поскольку мы используем Positioned для расположения Лого внутри стека, используем размер екрана и размер Лого для вычисления отступов.
Если не учитывать размер Лого, то виджет отобразится так, что его левый нижний угол будет находиться в центре екрана.
3. Трансформации реализованы:
    3а. /изменение положение вашего виджета на drag/ callback onHorizontalDragUpdate с использованием details.delta.dx, 
                                                     callback onVerticalDragUpdate   с использованием details.delta.dy,
    3b. /вращение виджета на long press/             callback onLongPressEnd запускает анимацию в прямом/обратном порядке,
                                                                                которую слушает виджет RotationTransition
    3с. /изменение формы или цвета на tap/           callback onTap, который вызывает setState, обновляя конфигурацию виджета FlutterLogo
## Problems

У меня не работает буква Э, поетому везде Е
## More

FlutterLogo я выбрал до того, как узнал, что при етом выборе для решения задачи не потребуется использовать виджет AnimatedContainer 
## Demo

https://disk.yandex.ru/i/DoO6rNYR5N1VRw
