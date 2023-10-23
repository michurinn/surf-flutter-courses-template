part of 'colors_pallete_bloc.dart';

sealed class ColorsPalleteState {
}

final class ColorsPalleteLoadingState extends ColorsPalleteState
{

}

final class ColorsPalleteLoadedState extends ColorsPalleteState
{
  List<ColorClass> colors;
ColorsPalleteLoadedState({required this.colors});
}