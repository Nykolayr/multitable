import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multitable/domain/models/multi.dart';
import 'package:multitable/domain/repository/user_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late final UserRepository _userRepository;
  late int step;
  late Multi multi;
  late String userAnswer;
  HomeBloc(this._userRepository) : super(HomeWaiting()) {
    step = _userRepository.step;
    multi = Multi(step);
    userAnswer = '';
    on<HomeEvent>((event, emit) async {
      if (event is PressCifra) {
        if ((userAnswer.isEmpty && event.cifra == 0) ||
            userAnswer.length == 2) {
          return;
        }
        userAnswer += '${event.cifra}';
        emit(StatePress());
      }
      if (event is PressDel) {
        if (userAnswer.isEmpty) return;
        userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        emit(StatePress());
      }
      if (event is PressHelp) {
        multi.help();
        emit(StatePress());
      }
      if (event is PressEnter) {
        if (userAnswer.isEmpty) return;
        if (int.parse(userAnswer) == multi.rezult()) {
          multi.right();
          emit(StatePress());
          await Future.delayed(const Duration(seconds: 2), () {
            if (multi.erorr.isNotEmpty) multi.doError--;
            if (multi.doError == 0) {
              multi.setOper(multi.erorr[0]);
            } else {
              step += 1;
              multi.setStep(step);
            }
            userAnswer = '';
          });
        } else {
          multi.setError(userAnswer);
          emit(StatePress());
          await Future.delayed(
              const Duration(seconds: 2), () => userAnswer = '');
        }
      }
      emit(HomeWaiting());
    });
  }
}
