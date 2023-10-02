class Controller {
  bool isAccept({required double value, required List<double> values}) {
    bool isAccept = false;
    if (value >= values[0] && value <= values[1]) {
      isAccept = true;
    }
    return isAccept;
  }

  bool isMoreThan({required double value, required double max}) {
    bool isTrue = false;
    if (value > max) {
      isTrue = true;
    }
    return isTrue;
  }

  double calDifference({required double value, required double max}) {
    double res = 200 * ((value - max).abs()) / (value + max);
    return res;
  }
}
