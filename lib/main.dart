import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_flutter_courses_template/bloc/magic_ball_bloc/magic_ball_cubit.dart';
import 'package:surf_flutter_courses_template/data/http_client/dio_http_client.dart';
import 'package:surf_flutter_courses_template/data/repository/magic_ball_answers_repository/magic_ball_answers_repository.dart';
import 'package:surf_flutter_courses_template/data/rest_client/rest_client.dart';
import 'package:surf_flutter_courses_template/presentation/magic_ball_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 857),
      child: MaterialApp(
        home: BlocProvider(
          create:(context) => MagicBallCubit(
            magicBallAnswersRepository: MagicBallAnswersRepository(
              restClient: RestClient(DioHttpClient().dio),
            ),
          ),
          child: const MaigicBallScreen(),
        ),
      ),
    );
  }
}
