int mapBuilder(List analyzedList, int i, Map resMap, int l) {
  if (i < analyzedList.length - 1) {
    while (i < analyzedList.length && analyzedList[i].indent == l) {
      if (analyzedList[i].index == null) {
        resMap[analyzedList[i].name] = analyzedList[i].value;
      } else if (analyzedList[i].index == 0) {
        var list = [];
        list.add(analyzedList[i].value);
        resMap[analyzedList[i].name] = list;
      } else {
        var list = resMap[analyzedList[i].name];
        list.add(analyzedList[i].value);
        resMap[analyzedList[i].name] = list;
      }
      i++;
    }
    if (i < analyzedList.length) {
      if (analyzedList[i - 1].indent < analyzedList[i].indent) {
        if (analyzedList[i - 1].index == null) {
          i = mapBuilder(analyzedList, i, resMap[analyzedList[i - 1].name],
              analyzedList[i].indent);
        } else {
          i = mapBuilder(
              analyzedList,
              i,
              resMap[analyzedList[i - 1].name][analyzedList[i - 1].index],
              analyzedList[i].indent);
        }
      }
      if (analyzedList[i - 1].indent > analyzedList[i].indent &&
          analyzedList[i].indent == l) {
        i = mapBuilder(analyzedList, i, resMap, analyzedList[i].indent);
      }
    }
  }
  return i;
}
