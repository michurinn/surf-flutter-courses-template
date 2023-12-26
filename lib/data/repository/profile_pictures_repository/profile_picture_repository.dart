// Репозиторий доступных фотографий порльзователя
abstract class IProfilePictureRepository
{
  Future<List<String>> getPhotosUrls();
}