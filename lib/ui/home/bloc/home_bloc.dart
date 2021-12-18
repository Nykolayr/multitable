// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multitable/repository/user_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required UserRepository userRepository,
  }) : super(HomeInitial()) {
    add(InitialEvent());
    int index = 0;
    int errorIndex = 2;
    List<List<int>> errorList = [];
    UserRepository _userRepository = userRepository;
    String _textAnswer = '';
    String _textquestion = '';
    int _operand1 = 0;
    int _operand2 = 0;
    on<HomeEvent>((event, emit) {
      if (event is InitialEvent) {
        for (var item in _userRepository.errorList) {
          errorList.add(item);
        }
      }
    });
  }
}
