import 'package:surf_flutter_courses_template/data/rest_client/rest_client.dart';

// Репозиторий ответов от шара
class MagicBallAnswersRepository {
  final RestClient restClient;

  MagicBallAnswersRepository({required this.restClient});
  // Получает случайный ответ от шара
  Future<String?> getAnswer() async {
    final response = await restClient.getForecast();
    return response.reading;
  }
}
