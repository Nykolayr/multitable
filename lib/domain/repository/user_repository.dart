import 'dart:convert';
import 'package:multitable/data/local_data.dart';

class UserRepository {
  String userName = 'Guest';
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
        errorList = json['errorList'];

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
      };
  saveUser() {
    LocalData().saveJson(toJson());
  }

// заново текущее задание
  reset() {
    step = 0;
    errorList = [];
    LocalData().saveJson(toJson());
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
