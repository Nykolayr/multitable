part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class NextStep extends HomeState {
  final String question;
  final String questionBottom;
  const NextStep(this.question, this.questionBottom);
}
