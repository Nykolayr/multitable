part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class PressLang extends SettingsEvent {
  final String lang;

  const PressLang(this.lang);
}

class PressTheme extends SettingsEvent {}

class PressSound extends SettingsEvent {}
