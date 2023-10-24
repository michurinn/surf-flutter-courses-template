import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_courses_template/data/colors_repository/colors_repository.dart';
import 'package:surf_flutter_courses_template/domain/color.dart';

part 'colors_pallate_events.dart';
part 'colors_pallete_state.dart';
// Блок для стейт-менеджмента экрана доступных цветов
class ColorsPalleteBloc extends Bloc<ColorsPalleteEvent, ColorsPalleteState> {
  ColorsPalleteBloc({required this.colorsRepository})
      : super(ColorsPalleteLoadingState()) {
    on<ColorsPalleteEventLoad>((event, emit) => _loadColors(event, emit));
  }
  // Репозиторий доступных цветов
  final IColorsRepository colorsRepository;
  // Загрузка цветов из репозитория
  Future<void> _loadColors(
      ColorsPalleteEventLoad event, Emitter<ColorsPalleteState> emit) async {
    final colors = colorsRepository.getColors();
    emit(
      ColorsPalleteLoadedState(colors: colors),
    );
  }
}
