import 'dart:convert';
import 'package:multitable/data/local_data.dart';

class UserRepository {
  //  имя
  String userName = 'Guest';
  // язык
  String lang = 'ru';
  // токен для последующих возможностей
  String token = '';
  // шаг ответов
  int step = 0;
  // сколько медалей за проейденые
  int medal = 0;
  // количество правильных ответов
  int trueAnswer = 0;
  // количество неправильных ответов
  int falseAnswer = 0;
  // сколько осталось ответов до того, когда надо взять из массива ошибок
  int doError = 2;
  // сколько было подсказок
  int hintCount = 0;
  // среднее время ответа
  double averegeAnswer = 0;
  // массив ошибок
  List<List<int>> errorList = [];
  UserRepository._();

  static Future<UserRepository> create() async {
    late UserRepository userRepository;
    String? data = await LocalData().loadJson();
    if (data != '{}' && data != '') {
      userRepository = UserRepository.fromJson(jsonDecode(data!));
    } else {
      userRepository = UserRepository._();
    }
    return userRepository;
  }

  UserRepository.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        lang = json['lang'],
        token = json['token'],
        step = json['step'],
        medal = json['medal'],
        trueAnswer = json['trueAnswer'],
        falseAnswer = json['falseAnswer'],
        hintCount = json['hintCount'],
        averegeAnswer = json['averegeAnswer'],
        errorList = json['errorList'],
        doError = json['doError'];

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'lang': lang,
        'token': token,
        'step': step,
        'medal': medal,
        'trueAnswer': trueAnswer,
        'falseAnswer': falseAnswer,
        'hintCount': hintCount,
        'averegeAnswer': averegeAnswer,
        'errorList': errorList,
        'doError': doError,
      };
  saveUser() {
    LocalData().saveJson(toJson());
  }

  addErrorList(List<int> list, int errorDo) {
    errorList.add(list);
    doError = errorDo;
    falseAnswer++;
    saveUser();
  }

  addHint() {
    hintCount++;
    saveUser();
  }

  setTrueAnswer() {
    trueAnswer++;
    saveUser();
  }

// заново текущее задание
  reset() {
    step = 0;
    errorList = [];
    doError = 2;
    saveUser();
  }

  clearUser() {
    userName = 'Guest';
    lang = 'ru';
    token = '';
    step = 0;
    medal = 0;
    trueAnswer = 0;
    falseAnswer = 0;
    hintCount = 0;
    averegeAnswer = 0;
    errorList = [];
    LocalData().saveJson(toJson());
  }
}
