import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Model extends ChangeNotifier {
  Map<String, List<String>> _rate = {
    '中途採用比率': ['10', '20', '30'],
    '中途採用比率2': ['10', '20', '30'],
  };

  Map<String, List<String>> get rate => _rate;

  set rate(Map<String, List<String>> newRate) {
    _rate = newRate;
    notifyListeners();
  }

  Map<String, String> _info = {
    '正社員の平均継続勤務年数 （単位：年）': '18.5',
    '従業員の平均年齢 （単位：歳）': '50.5',
    '月平均所定外労働時間 （単位：時間）': '18',
    '平均の法定時間外労働60時間以上の労働者の数 （単位：人）': '15',
  };

  Map<String, String> get info => _info;

  set info(Map<String, String> newInfo) {
    _info = newInfo;
    notifyListeners();
  }

  LinkedHashMap<String, String> _maleChildCareLeave = LinkedHashMap.from({
    '正社員': '34',
    '専門職': '50',
  });

  LinkedHashMap<String, String> get maleChildCareLeave => _maleChildCareLeave;

  set maleChildCareLeave(LinkedHashMap<String, String> newMaleChildCareLeave) {
    _maleChildCareLeave = newMaleChildCareLeave;
    notifyListeners();
    print('maleChildCareLeave==============: $maleChildCareLeave');
  }

  LinkedHashMap<String, String> _femaleChildCareLeave = LinkedHashMap.from({
    '正社員': '34',
    '専門職': '50',
  });

  LinkedHashMap<String, String> get femaleChildCareLeave => _femaleChildCareLeave;

  set femaleChildCareLeave(LinkedHashMap<String, String> newFemaleChildCareLeave) {
    _femaleChildCareLeave = newFemaleChildCareLeave;
    notifyListeners();
    print('femaleChildCareLeave==============: $femaleChildCareLeave');
  }
}

Map<String, String> _infoUnits = {
  '正社員の平均継続勤務年数 （単位：年）': '年',
  '従業員の平均年齢 （単位：歳）': '歳',
  '月平均所定外労働時間 （単位：時間）': '時間',
  '平均の法定時間外労働60時間以上の労働者の数 （単位：人）': '人',
};

get infoUnits => _infoUnits;
