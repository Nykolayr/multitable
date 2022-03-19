import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multitable/domain/models/multi.dart';
import 'package:multitable/domain/repository/user_repository.dart';
import 'package:multitable/utils/value.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late final UserRepository userRepository;
  late Multi multi;
  late String userAnswer;
  Secundomer secundomer = Secundomer();
  bool isEndStep = false;
  bool isEnd = false;
  HomeBloc(this.userRepository) : super(HomeWaiting()) {
    multi = Multi(userRepository.step);
    userAnswer = '';
    multi.doError = userRepository.doError;
    multi.erorr = userRepository.errorList;
    checkEnd() {
      if (partsList.length - 1 != userRepository.step) {
        userRepository.step++;
        multi.setStep(userRepository.step);
      } else {
        isEndStep = true;
        userRepository.medal++;
        if (userRepository.sound) end.play();
        Future.delayed(const Duration(milliseconds: 2500), () {
          end.stop();
        });
      }
    }

    secundomer.run();
    on<HomeEvent>((event, emit) async {
      if (event is PressLangStat) {
        await Future.delayed(const Duration(milliseconds: 300), () {});
        multi = Multi(userRepository.step);
        emit(StatePress());
      }
      if (event is PressNo) {
        isEndStep = false;
        userRepository.reset();
        multi.setStep(userRepository.step);
        isEnd = false;
        emit(StatePress());
      }
      if (event is PressYes) {
        isEndStep = false;
        userRepository.reset();
        multi.setStep(userRepository.step);
        isEnd = false;
        emit(StatePress());
      }
      if (event is PressCifra) {
        if ((userAnswer.isEmpty && event.cifra == 0) ||
            userAnswer.length == 2) {
          return;
        }
        userAnswer += '${event.cifra}';
        if (userRepository.sound) click.play();
        emit(StatePress());
      }
      if (event is PressDel) {
        if (userAnswer.isEmpty) return;
        userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        if (userRepository.sound) click.play();
        emit(StatePress());
      }
      if (event is PressHelp) {
        multi.help();
        userRepository.addHint();
        if (userRepository.sound) click.play();
        emit(StatePress());
      }
      if (event is PressEnter) {
        if (userAnswer.isEmpty) return;
        int time = secundomer.stop().inMilliseconds;
        if (int.parse(userAnswer) == multi.rezult()) {
          userRepository.setTrueAnswer();
          multi.right();
          emit(StatePress());
          if (userRepository.sound) positiv.play();
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
          if (userRepository.sound) negativ.play();
          if (!isEndStep) {
            multi.setError(userAnswer);
            userRepository.addErrorList(multi.erorr.last, multi.doError);
            emit(StatePress());
            await Future.delayed(const Duration(seconds: 2), () {
              userAnswer = '';
              checkEnd();
            });
          } else {
            userRepository.doError++;
          }
        }
        if (isEndStep && multi.erorr.isEmpty) isEnd = true;
        userRepository.averegeAnswer += time / 1000;
        userRepository.averegeAnswerAll += time / 1000;
        userRepository.saveUser();
        secundomer.run();
      }
      if (userRepository.sound) positiv.stop();
      if (userRepository.sound) negativ.stop();
      emit(HomeWaiting());
    });
  }
}

class Secundomer {
  late DateTime _initialTime;
  Timer? _timer;
  Duration _elapsed = Duration.zero;
  run() {
    _initialTime = DateTime.now();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      final now = DateTime.now();
      _elapsed = now.difference(_initialTime);
    });
  }

  Duration stop() {
    _timer!.cancel();

    return _elapsed;
  }
}
