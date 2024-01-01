// Базовый класс состояний экрана с магическим шаром
sealed class MagicBallState {}

// Состояние готовности услышать вопрос
class MagicBallListeningState extends MagicBallState {}

// Состояние обдумывания ответа
class MagicBallProcessingState extends MagicBallState {}

// Состояние озвучивания ответа
class MagicBallAnsweringState extends MagicBallState {
  // Ответ на вопрос
  final String answer;

  MagicBallAnsweringState(this.answer);
}

// Состояние ошибки при формировании ответа
class MagicBallErrorState extends MagicBallState {
  // Сообщение для пользователя
  final String errorMessage;

  MagicBallErrorState(this.errorMessage);
}
