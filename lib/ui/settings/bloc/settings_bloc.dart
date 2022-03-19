import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:multitable/domain/repository/user_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  late UserRepository userRepository;
  late String lang;
  late bool isSound;
  SettingsBloc(this.userRepository) : super(SettingsWaiting()) {
    lang = getTextLang(userRepository.lang);
    isSound = userRepository.sound;
    on<SettingsEvent>((event, emit) async {
      if (event is PressSound) {
        isSound = !isSound;
        userRepository.sound = isSound;
        userRepository.saveUser();
        emit(SettingsPress());
      }
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
