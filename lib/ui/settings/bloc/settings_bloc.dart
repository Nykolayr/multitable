import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:multitable/domain/repository/user_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  late final UserRepository userRepository;
  late String lang;
  SettingsBloc(this.userRepository) : super(SettingsWaiting()) {
    lang = getTextLang(userRepository.lang);
    on<SettingsEvent>((event, emit) async {
      if (event is PressLang) {
        userRepository.lang = event.lang;
        lang = getTextLang(userRepository.lang);
        userRepository.saveUser();
        emit(SettingsPress());
      }
      if (event is PressTheme) {
        emit(SettingsPress());
      }
      emit(SettingsWaiting());
    });
  }
}

String getTextLang(String lang) {
  switch (lang) {
    case 'ru':
      return tr('russian');
    case 'en':
      return tr('english');
    default:
      return tr('russian');
  }
}
