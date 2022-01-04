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

class CounterResetCountInput extends Input {
  @override
  String toString() {
    return 'CounterResetCountInput{}';
  }
}

class CounterSaveCountInput extends SuccessInput {}

class CounterRetrieveCountInput extends SuccessInput {
  final int count;

  CounterRetrieveCountInput({required this.count});
}
