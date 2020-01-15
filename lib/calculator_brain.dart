import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;
  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than average body weight, try exercising more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight, good job!';
    } else {
      return 'You have a lower than normal body weight, try to eat a bit more.';
    }
  }
}
