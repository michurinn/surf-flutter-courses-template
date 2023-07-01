import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LogoWidget());
  }
}

class LogoWidget extends StatefulWidget {
  const LogoWidget({super.key});

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> with TickerProviderStateMixin {
  late FlutterLogoStyle style;
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late double x0, y0;
  final double size = 200.0;
  @override
  void initState() {
    super.initState();

    style = FlutterLogoStyle.horizontal;
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    );
  }

  @override
  void didChangeDependencies() {
    x0 = MediaQuery.of(context).size.width / 2;
    y0 = MediaQuery.of(context).size.height / 2;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: y0 -
                size /
                    2, // Чтобы в центре екрана находился центр логотипа, а не начальная точка
            left: x0 -
                size /
                    2, // Чтобы в центре екрана находился центр логотипа, а не начальная точка
            child: RotationTransition(
              turns: _animation,
              child: FlutterLogo(
                style: style,
                size: size,
              ),
            ),
          ),
          Positioned.fill(
              child: GestureDetector(
            onTap: () => setState(() {
              late FlutterLogoStyle newstyle;
              // При нажатии всегда меняется виджет
              do {
                newstyle = FlutterLogoStyle.values[Random().nextInt(3)];
              } while (style == newstyle);
              style = newstyle;
            }),
            onHorizontalDragUpdate: (details) {
              setState(() {
                x0 += details.delta.dx;
                x0 = x0.clamp(
                    size / 2, MediaQuery.of(context).size.width - size / 2);
              });
            },
            onVerticalDragUpdate: (details) {
              setState(() {
                y0 += details.delta.dy;
                y0 = y0.clamp(
                    size / 2, MediaQuery.of(context).size.height - size / 2);
              });
            },
            onLongPressEnd: (details) {
              _controller.status == AnimationStatus.completed
                  ? _controller.reverse()
                  : _controller.forward();
            },
          ))
        ],
      ),
    );
  }
}
