import 'dart:math';

//? this will calculate the dash length in the dashed border
double getDashLength(double gl, int n, double d, double p) {
  int N = n == 1 ? 0 : n;
  double R = d + 2 * p;
  double c = pi * R;
  double l = (c - N * gl) / N;
  return l;
}

//? this will calculate the length of the border and the gap based on it's circle diameter
//? and fill radius
List<double> getPattern(double fillFactor, double d) {
// radius = 45;
// fill factor = .75
  double C = pi * d;
  double dashLength = C * fillFactor;
  double gapLength = C * (1 - fillFactor);
  return [dashLength, gapLength];
}
