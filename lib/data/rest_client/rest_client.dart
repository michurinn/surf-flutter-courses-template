import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';


@RestApi(baseUrl: 'https://eightballapi.com/api/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

   @GET('')
   Future<ForecastDto> getForecast();
}
// Ответ от шара
@JsonSerializable()
class ForecastDto {
  const ForecastDto({this.reading,});

  factory ForecastDto.fromJson(Map<String, dynamic> json) => _$ForecastDtoFromJson(json);

  final String? reading;

  Map<String, dynamic> toJson() => _$ForecastDtoToJson(this);
}