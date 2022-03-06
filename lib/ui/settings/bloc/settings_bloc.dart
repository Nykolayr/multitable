import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multitable/domain/repository/user_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  late final UserRepository userRepository;
  SettingsBloc(this.userRepository) : super(SettingsWaiting()) {
    on<SettingsEvent>((event, emit) async {
      if (event is PressLang) {
        if (userRepository.lang == 'ru') {
          userRepository.lang = 'en';
        } else {
          userRepository.lang = 'ru';
        }
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
