import 'package:dio/dio.dart';
import 'package:surf_flutter_courses_template/data/model/profile_picture_dto.dart';
import 'package:surf_flutter_courses_template/data/repository/profile_pictures_repository/profile_picture_repository.dart';
// Репозиторий доступных фотографий порльзователя, реализация на моковых данных 
class ProfilePictureRepository implements IProfilePictureRepository {
  final dio = Dio()
    ..options.baseUrl = 'https://api.slingacademy.com'
    ..interceptors.add(LogInterceptor(requestBody: false, responseHeader: false, responseBody: true))
    ..options.responseType = ResponseType.json;

  @override
  Future<List<String>> getPhotosUrls() async {
    try {
      final result = await dio.get('/v1/sample-data/photos');
      if (result.statusCode == 200) {
        final List resultMap = result.data['photos'];
        final photosDtoList =
            resultMap.map((e) => ProfilePictureDto.fromJson(e)).toList();
        return photosDtoList.map((e) => e.url).toList();
      } else {
        return [];
      }
    } on Exception catch (_) {
      rethrow;
      // Оставил в таком виде, поскольку тема занятия не обработка ошибок, но и написать здесь return [] -
      //  значит забыть добавить обработку исключения впоследствии
      // TODO(me): Add exception handling
    }
  }
}
