// Модель данных, получаемая от мокового репозитория ProfilePictureRepository
class ProfilePictureDto {
  final String id;
  final String url;
  final String title;
  final String description;
  final String user;

  ProfilePictureDto._(
      this.id, this.url, this.title, this.description, this.user);

  factory ProfilePictureDto.fromJson(Map<String, dynamic> json) {
    return ProfilePictureDto._(
        valueOrDefault('id', '0', json),
        valueOrDefault('url', '0', json),
        valueOrDefault('title', '0', json),
        valueOrDefault('description', '0', json),
        valueOrDefault('user', '0', json));
  }
}

String valueOrDefault(String key, String defalut, Map<String, dynamic> json) {
  if (json.containsKey(key)) {
    return json[key].toString();
  } else {
    return defalut.toString();
  }
}
