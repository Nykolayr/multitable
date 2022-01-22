/*   классы   */
//класс умножения
import 'package:easy_localization/easy_localization.dart';
import 'package:multitable/utils/value.dart';

enum StatusInfo { normal, help, error }

class Multi {
  // массив ошибок
  List<List<int>> erorr = [];
  // сколько осталось ответов до того, когда надо взять из массива ошибок
  int doError = 2;
  // длинный вопрос или нет
  bool isLong = false;
  // статус надписи {normal, help, error} по существу цвет
  StatusInfo status = StatusInfo.normal;
  // операнды в воросе и информационной надписи
  int _operQuest1 = 2;
  int _operQuest2 = 2;
  int _operAnswer1 = 2;
  int _operAnswer2 = 2;
  //
  String answer = '';
  final String _signMult = '\u{00D7}'; // знак умножения
  final String _zap = tr('remember');
  // установка операндов
  setOper(List<int> oper) {
    _operAnswer1 = oper[0];
    _operAnswer2 = oper[1];
    _operQuest1 = oper[0];
    _operQuest2 = oper[1];
    if (oper.length > 2) {
      answer = strZap();
    } else {
      answer = tr('enter_answer');
    }
  }

  Multi(int step) {
    setStep(step);
  }
// ошибка
  void setError(String userAnswer) {
    status = StatusInfo.error;
    answer = userAnswer + tr('incorrect');
    doError = 2;
    erorr.add([_operQuest1, _operQuest2]);
  }

// подсказка
  void help() {
    status = StatusInfo.help;
    answer = tr('right_answer') + ' ${rezult()}';
  }

// надпись правильно
  void right() {
    status = StatusInfo.help;
    answer = tr('right');
  }

// следующий шаг
  setStep(int step) {
    status = StatusInfo.normal;
    setOper(partsList[step]);
  }

  //возращает результат умножения
  int rezult() {
    return _operAnswer1 * _operAnswer2;
  }

  //возращает строку с умножением
  String strQuest() {
    return '$_operAnswer1 $_signMult $_operAnswer2 = ';
  }

//возращает строку с умножением и ответом
  String strAnswer() {
    String lt = rezult().toString();
    return '$_operAnswer1 $_signMult $_operAnswer2 = $lt';
  }

  //возращает строку с умножением и результатом в запомни
  String strZap() {
    String ret = _zap;
    String lt = rezult().toString();
    if (_operQuest1 != _operQuest2) ret += '\n';
    ret += ' $_operQuest1 $_signMult $_operQuest2 = $lt';
    isLong = _operQuest1 != _operQuest2;
    if (_operQuest1 != _operQuest2) {
      ret += ' и $_operQuest2 $_signMult $_operQuest1 = $lt';
    }

    return ret;
  }
}
