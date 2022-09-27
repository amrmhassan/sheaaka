import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';

//? to handle the loves to string
String lovesToString(int n) {
  if (n < 1000) {
    return n.toString();
  } else {
    return '${doubleToString(n / 1000, 1)}K';
  }
}

//? to handle double to string
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

//? date to string date
String dateToString(DateTime date) {
  return '${date.year}-${date.month}-${date.day}';
}

//? make random list with random length from a list
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

Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}
