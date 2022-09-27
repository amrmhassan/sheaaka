import 'dart:math';

String lovesToString(int n) {
  if (n < 1000) {
    return n.toString();
  } else {
    return '${doubleToString(n / 1000, 1)}K';
  }
}

String doubleToString(double d, [int roundTo = 2]) {
  List<String> s = d.toStringAsFixed(roundTo).split('');
  for (int i = 0; i < roundTo; i++) {
    if (s.last == '0') {
      s.removeLast();
    }
  }

  if (s.last == '.') {
    s.removeLast();
  }
  return s.join();
}

String dateToString(DateTime date) {
  return '${date.year}-${date.month}-${date.day}';
}

List getRandomList(List originalList, [int? length]) {
  List randomList = [];

  int randomListLength = length ?? Random().nextInt(originalList.length + 1);

  int i = 0;

  while (i < randomListLength) {
    dynamic item = originalList[Random().nextInt(originalList.length)];
    if (!randomList.contains(item)) {
      randomList.add(item);
      i++;
    }
  }

  return randomList;
}
