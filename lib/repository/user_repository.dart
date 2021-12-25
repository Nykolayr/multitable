import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  String userName = 'Гость';
  String lang = 'ru';
  String token = '';
  int step = 0;
  int medal = 0;
  int trueAnswer = 0;
  int falseAnswer = 0;
  int hintCount = 0;
  double averegeAnswer = 0;
  List<List<int>> errorList = [];
  UserRepository._();
  static Future<UserRepository> create() async {
    UserRepository userRepository = UserRepository._();
    await userRepository.loadUser();
    return userRepository;
  }

  Future<void> saveDataApi(source, user) async {
    await saveUser();
  }

  Future<void> saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', userName);
    await prefs.setString('lang', lang);
    await prefs.setString('token', token);
    await prefs.setInt('step', step);
    await prefs.setInt('medal', medal);
    await prefs.setInt('trueAnswer', trueAnswer);
    await prefs.setInt('falseAnswer', falseAnswer);
    await prefs.setInt('hintCount', hintCount);
    await prefs.setDouble('averegeAnswer', averegeAnswer);

    await prefs.setString('errorList', jsonEncode(errorList));
  }

  Future<void> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> setKeys = prefs.getKeys();
    if (setKeys.contains('username')) {
      userName = prefs.getString('username') ?? '';
      token = prefs.getString('token') ?? '';
      lang = prefs.getString('lang') ?? '';
      step = prefs.getInt('step') ?? 0;
      medal = prefs.getInt('medal') ?? 0;
      step = prefs.getInt('step') ?? 0;
      trueAnswer = prefs.getInt('trueAnswer') ?? 0;
      trueAnswer = prefs.getInt('trueAnswer') ?? 0;
      falseAnswer = prefs.getInt('falseAnswer') ?? 0;
      hintCount = prefs.getInt('hintCount') ?? 0;
      averegeAnswer = prefs.getDouble('averegeAnswer') ?? 0;
      try {
        errorList = json.decode(prefs.getString('errorList') ?? '');
      } catch (e) {
        errorList = [];
      }
    } else {
      await saveUser();
    }
  }
}
