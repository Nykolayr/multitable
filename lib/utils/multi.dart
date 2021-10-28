/*   классы   */
//класс умножения
class Multi {
  int _operQuest1 = 2;
  int _operQuest2 = 2;
  int _operAnswer1 = 2;
  int _operAnswer2 = 2;
  String answer = '';
  final String _signMult = '\u{00D7}'; // знак умножения
  final String _zap = ' Запомни:';
  setOper(List<int> oper) {
    _operAnswer1 = oper[0];
    _operAnswer2 = oper[1];
    if (oper.length > 2) {
      _operQuest1 = oper[0];
      _operQuest2 = oper[1];
    }
    answer = '${rezult()}';
  }

  //возращает результат умножения
  rezult() {
    return _operAnswer1 * _operAnswer2;
  }

  //возращает строку с умножением
  strQuest() {
    return '$_operAnswer1 $_signMult $_operAnswer2 = ';
  }

//возращает строку с умножением и ответом
  strAnswer() {
    String lt = rezult().toString();
    return '$_operAnswer1 $_signMult $_operAnswer2 = $lt';
  }

  //возращает строку с умножением и результатом в запомни
  strZap() {
    String ret = "$_zap";
    String lt = rezult().toString();
    ret += ' $_operQuest1 $_signMult $_operQuest2 = $lt';
    if (_operQuest1 != _operQuest2) {
      ret += ' и $_operQuest2 $_signMult $_operQuest1 = $lt';
    }
    return ret;
  }
}
