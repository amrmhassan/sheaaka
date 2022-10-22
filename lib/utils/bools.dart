bool boolifyNull(bool? i) {
  if (i == null) {
    return false;
  } else {
    return i;
  }
}
