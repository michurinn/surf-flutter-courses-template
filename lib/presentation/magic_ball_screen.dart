import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_flutter_courses_template/bloc/magic_ball_bloc/magic_ball_cubit.dart';
import 'package:surf_flutter_courses_template/bloc/magic_ball_bloc/magic_ball_state.dart';

// Экран с магическим шаром
class MaigicBallScreen extends StatefulWidget {
  const MaigicBallScreen({super.key});

  @override
  State<MaigicBallScreen> createState() => _MaigicBallScreenState();
}

class _MaigicBallScreenState extends State<MaigicBallScreen>
    with TickerProviderStateMixin {
  final answerTextStyle = const TextStyle(color: Colors.white, fontSize: 24);
  // Текст для отображения внутри шарика
  String? _text;
  // Контроллер движения шара вверх/вниз
  late final AnimationController _movementAnimationController;
  // Анимация движения шара вверх/вниз
  late final Animation<Alignment> _movementAnimation;

  // Контроллер появления/исчезновения содержимого шара
  late final AnimationController _magicBallBodyAnimationController;
  // Анимация появления/исчезновения содержимого шара
  late final Animation<double> _magicBallBodyAnimation;
// Анимация появления/исчезновения текста внутри шара
  late final Animation<double> _magicBallTextAnimation;

  @override
  void initState() {
    super.initState();
    _movementAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
      reverseDuration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);
    _movementAnimation = _movementAnimationController.drive(
      Tween<Alignment>(
        begin: const Alignment(0, 0),
        end: const Alignment(0, 0.05),
      ),
    );

    // Используется для определения 2-х взаимоисключающих процессов: появления фона шара (этап обдумывания ответа)
    // и появления текста внутри шара (этап появления ответа)
    _magicBallBodyAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );

    // Используется с виджетом Opacity, при прохождении анимации становится из прозрачного непрозрачным
    _magicBallBodyAnimation = _magicBallBodyAnimationController.drive(
      Tween<double>(
        begin: 0,
        end: 1,
      ),
    );
    // Используется с виджетом Opacity, при прохождении анимации становится из непрозрачного прозрачным
    _magicBallTextAnimation = _magicBallBodyAnimationController.drive(
      Tween<double>(
        begin: 1,
        end: 0,
      ),
    );
  }

  @override
  void dispose() {
    _movementAnimationController.dispose();
    _magicBallBodyAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MagicBallCubit, MagicBallState>(
      listener: (context, state) {
        switch (state) {
          case MagicBallListeningState():
            _movementAnimationController.fling();
            break;
          case MagicBallProcessingState():
            _movementAnimationController.stop();
            _magicBallBodyAnimationController.forward();
            break;
          case MagicBallAnsweringState(answer: var answer):
            _magicBallBodyAnimationController.reverse();
            _movementAnimationController.fling();
            _text = answer;
            break;
          case MagicBallErrorState(errorMessage: var errorMessage):
            _magicBallBodyAnimationController.reverse();
            _movementAnimationController.fling();
            _text = errorMessage;
            break;
        }
      },
      child: BlocBuilder<MagicBallCubit, MagicBallState>(
        buildWhen: (_, current) =>
            current is MagicBallAnsweringState ||
            current is MagicBallErrorState,
        builder: (context, state) {
          final textStyle = answerTextStyle.copyWith(
              color: state is MagicBallErrorState ? Colors.red : Colors.white);
          return Scaffold(
            body: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF100C2C),
                            Color(0xFF000002),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AnimatedBuilder(
                    animation: _movementAnimation,
                    child: GestureDetector(
                      onTap: () => context.read<MagicBallCubit>().getAnswer(),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/magicBall.png'),
                          AnimatedBuilder(
                            animation: _magicBallBodyAnimation,
                            builder: (context, child) => Opacity(
                              opacity: _magicBallBodyAnimation.value,
                              child: child,
                            ),
                            child: CustomPaint(
                              painter: _CircleBlurPainter(blurSigma: 30.0),
                              child: SizedBox(
                                height: 300.w,
                                width: 300.w,
                              ),
                            ),
                          ),
                          AnimatedBuilder(
                            animation: _magicBallTextAnimation,
                            builder: (context, child) => Opacity(
                              opacity: _magicBallTextAnimation.value,
                              child: child,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
                              child: Center(
                                child: Text(
                                  _text ?? '',
                                  style: textStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    builder: (context, child) => Align(
                        alignment: _movementAnimation.value, child: child),
                  ),
                ),
                const Positioned(
                  bottom: 30,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      'Нажмите на шар \n или потрясите телефон',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF727272),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

// Виджет затемняющего шар круга
class _CircleBlurPainter extends CustomPainter {
  _CircleBlurPainter({required this.blurSigma});

  double blurSigma;

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = const Color(0xFF100C2C)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
