// Стейты экрана формы регистрации питомцев
sealed class PetRegistrationScreenState {}

// Инициирующий стейт, нет введённых данных
class NoData extends PetRegistrationScreenState {}

// Форма не прошла валидацию или не заполнена
class ErrorState extends PetRegistrationScreenState {}

// Загрузка, де факто не используется
class LoadingState extends PetRegistrationScreenState {}

// Всё готово к отправке
class ReadyState extends PetRegistrationScreenState {}
