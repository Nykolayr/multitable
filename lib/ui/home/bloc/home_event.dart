part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class PressCifra extends HomeEvent {
  final int cifra;
  const PressCifra(this.cifra);
}

class PressHelp extends HomeEvent {}

class PressDel extends HomeEvent {}

class PressEnter extends HomeEvent {}
class PressYes extends HomeEvent {}
class PressNo extends HomeEvent {}
