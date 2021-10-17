import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multitable/repository/userRepository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required UserRepository userRepository,
  }) : super(HomeInitial()) {
    final UserRepository _userRepository;
    on<HomeEvent>((event, emit) {});
  }
}
