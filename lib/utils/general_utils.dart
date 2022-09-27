import 'dart:math';

import 'package:project/models/types.dart';

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

List<Sizes> getRandomProductSize() {
  List<Sizes> randomSizes = [];
  List<Sizes> allSizes = Sizes.values;
  int length = Random().nextInt(allSizes.length);
  List.generate(length, (index) {
    Sizes size = allSizes[Random().nextInt(length)];
    if (!randomSizes.contains(size)) {
      randomSizes.add(size);
    }
  });
  return randomSizes;
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
