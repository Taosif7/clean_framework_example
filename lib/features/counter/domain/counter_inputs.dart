import 'package:clean_framework/clean_framework_providers.dart';

class CounterIncreaseCountInput extends Input {
  final int count;

  CounterIncreaseCountInput({required this.count});

  @override
  String toString() {
    return 'CounterIncreaseCountInput{count: $count}';
  }
}

class CounterDecreaseCountInput extends Input {
  final int count;

  CounterDecreaseCountInput({required this.count});

  @override
  String toString() {
    return 'CounterDecreaseCountInput{count: $count}';
  }
}

class CounterRestCountInput extends Input {
  @override
  String toString() {
    return 'CounterRestCountInput{}';
  }
}
