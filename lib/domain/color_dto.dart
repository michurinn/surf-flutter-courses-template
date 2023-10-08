import 'package:json_annotation/json_annotation.dart';
part 'color_dto.g.dart';

// Содержит цвет и его характеристики, полученные с сервера
@JsonSerializable()
class ColorDTO {
  //Название цвета
  final String name;
  // Код цвета HEX
  // Сейчас является nullable полем, поскольку это допустимо описанием входных данных
  final String? value;

  ColorDTO({required this.name, required this.value});

  factory ColorDTO.fromJson(Map<String, dynamic> json) =>
      _$ColorDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ColorDTOToJson(this);
}
