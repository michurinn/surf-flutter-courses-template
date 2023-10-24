part of 'colors_pallete_bloc.dart';

sealed class ColorsPalleteEvent {}
// Загрузить цвета из репозитория
final class ColorsPalleteEventLoad extends ColorsPalleteEvent
{}
