import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:surf_flutter_courses_template/bloc/magic_ball_bloc/magic_ball_state.dart';
import 'package:surf_flutter_courses_template/data/repository/magic_ball_answers_repository/magic_ball_answers_repository.dart';

// State manager для экрана с магическим шаром
class MagicBallCubit extends Cubit<MagicBallState> {
  MagicBallCubit({
    required magicBallAnswersRepository,
  })  : _magicBallAnswersRepository = magicBallAnswersRepository,
        super(MagicBallListeningState()) {
    _shakeDetector = ShakeDetector.autoStart(onPhoneShake: () {
      getAnswer();
    });
  }
  // Репозиторий для получения ответов от шара
  final MagicBallAnswersRepository _magicBallAnswersRepository;
  // Определяет когда пользователь трясёт телефон
  late final ShakeDetector _shakeDetector;
  // В состоянии получения ответа запрос новых событий невозможен
  bool _isLoading = false;

  // Даёт ответ на вопрос
  void getAnswer() async {
    emit(MagicBallProcessingState());
    _isLoading = true;
    try {
      final response = await _magicBallAnswersRepository.getAnswer();
      if (response == null) {
        emit(MagicBallErrorState('Error. Try again'));
        _isLoading = false;
        return;
      }
      emit(MagicBallAnsweringState(response));
      _isLoading = false;
    } on Exception catch (_) {
      emit(MagicBallErrorState('Error. Try again'));
      _isLoading = false;
    }
  }
}
