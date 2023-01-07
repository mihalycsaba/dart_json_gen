import 'StringAnalyzer.dart';
import 'mapBuilder.dart';

Map listToJsonMap(List list) {
  var analyzedList = [];
  var resMap = {};
  var i = 0;
  var l = 0;

  for (i = 0; i < list.length; i++) {
    if (list[i].trim() == '') {
      i++;
    }

    if (i < list.length - 1 && list[i].trim() != '') {
      analyzedList.add(StringAnalyzer(list[i]));
    }
  }
  i = 0;

  mapBuilder(analyzedList, i, resMap, l);
  return resMap;
}
