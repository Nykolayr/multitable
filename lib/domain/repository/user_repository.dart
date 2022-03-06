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
  // сколько было подсказок
  int hintCount = 0;
  // среднее время ответа
  double averegeAnswer = 0;
  // количество правильных ответов общее
  int trueAnswerAll = 0;
  // количество неправильных ответов общее
  int falseAnswerAll = 0;
  // сколько было подсказок общее
  int hintCountAll = 0;
  // среднее время ответа общее
  double averegeAnswerAll = 0;
  // сколько осталось ответов до того, когда надо взять из массива ошибок
  int doError = 2;
  // массив ошибок
  List errorList = [];
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
        trueAnswerAll = json['trueAnswerAll'],
        falseAnswerAll = json['falseAnswerAll'],
        hintCountAll = json['hintCountAll'],
        averegeAnswerAll = json['averegeAnswerAll'],
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
        'trueAnswerAll': trueAnswerAll,
        'falseAnswerAll': falseAnswerAll,
        'hintCountAll': hintCountAll,
        'averegeAnswerAll': averegeAnswerAll,
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
    falseAnswerAll++;
    saveUser();
  }

  addHint() {
    hintCount++;
    hintCountAll++;
    saveUser();
  }

  setTrueAnswer() {
    trueAnswer++;
    trueAnswerAll++;
    saveUser();
  }

// заново текущее задание
  reset() {
    step = 0;
    errorList = [];
    doError = 2;
    trueAnswer = 0;
    falseAnswer = 0;
    hintCount = 0;
    averegeAnswer = 0;
    saveUser();
  }

  clearUser() {
    userName = 'Guest';
    token = '';
    medal = 0;
    trueAnswerAll = 0;
    falseAnswerAll = 0;
    hintCountAll = 0;
    averegeAnswerAll = 0;
    reset();
  }
}
