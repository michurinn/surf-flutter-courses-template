import 'package:surf_flutter_courses_template/data/repository/profile_pictures_repository/profile_picture_repository.dart';
// Интерактор для получения всех фотографий пользорвателя (а точнее, ссылко на них)
class ProfilePicturesInteractor {
  final IProfilePictureRepository _profilePictureRepository;

  ProfilePicturesInteractor(this._profilePictureRepository);
  Future<List<String>> getPhotosUrls() {
    return _profilePictureRepository.getPhotosUrls();
  }
}
