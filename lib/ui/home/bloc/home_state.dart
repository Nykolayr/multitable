part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState([int step = 0]);

  @override
  List<Object> get props => [];
}

class HomeWaiting extends HomeState {}

class StatePress extends HomeState {}
