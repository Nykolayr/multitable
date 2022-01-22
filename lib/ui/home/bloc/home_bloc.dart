import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multitable/domain/models/multi.dart';
import 'package:multitable/domain/repository/user_repository.dart';
import 'package:multitable/utils/value.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late final UserRepository _userRepository;
  late int step;
  late Multi multi;
  late String userAnswer;
  bool isEndStep = false;
  bool isEnd = false;
  HomeBloc(this._userRepository) : super(HomeWaiting()) {
    step = _userRepository.step;
    multi = Multi(step);
    userAnswer = '';
    multi.doError = _userRepository.doError;
    multi.erorr = _userRepository.errorList;
    checkEnd() {
      if (partsList.length - 1 != step) {
        step++;
        multi.setStep(step);
      } else {
        isEndStep = true;
      }
    }

    on<HomeEvent>((event, emit) async {
      if (event is PressNo) {}
      if (event is PressYes) {
        step = 0;
        isEndStep = false;
        _userRepository.reset();
        multi.setStep(step);
        isEnd = false;
      }
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
        _userRepository.addHint();
        emit(StatePress());
      }
      if (event is PressEnter) {
        if (userAnswer.isEmpty) return;

        if (int.parse(userAnswer) == multi.rezult()) {
          _userRepository.setTrueAnswer();
          multi.right();
          emit(StatePress());
          await Future.delayed(const Duration(seconds: 2), () {
            if (multi.erorr.isNotEmpty) multi.doError--;
            if (isEndStep) multi.doError = 0;
            if (multi.doError == 0 && multi.erorr.isNotEmpty) {
              multi.setOper(multi.erorr[0]);
              multi.erorr.removeAt(0);
              multi.doError = 2;
            } else {
              checkEnd();
            }
            userAnswer = '';
          });
        } else {
          if (!isEndStep) {
            multi.setError(userAnswer);
            _userRepository.addErrorList(multi.erorr.last, multi.doError);
            emit(StatePress());
            await Future.delayed(const Duration(seconds: 2), () {
              userAnswer = '';
              checkEnd();
            });
          } else {
            _userRepository.doError++;
            _userRepository.saveUser();
          }
        }
        if (isEndStep && multi.erorr.isEmpty) isEnd = true;
      }
      emit(HomeWaiting());
    });
  }
}
