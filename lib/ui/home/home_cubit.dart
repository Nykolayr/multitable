import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable/domain/models/multi.dart';

class HomeCubit extends Cubit<Multi> {
  HomeCubit(Multi initialState) : super(initialState);
  void addCifra(int cifra) {
    if (state.userAnswer.length < 3) {
      state.userAnswer += '$cifra';
      emit(state);
      emit(state);
    }
    print('console222 ${state.userAnswer}');
  }
}
